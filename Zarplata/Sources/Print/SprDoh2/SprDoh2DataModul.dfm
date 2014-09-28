object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 738
  Top = 590
  Height = 301
  Width = 359
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
    Top = 48
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 104
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbTools, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39647.492762662000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    OnAfterPrintReport = ReportAfterPrintReport
    Left = 168
    Datasets = <
      item
        DataSet = ReportDBDSet
        DataSetName = 'ReportDBDSet'
      end
      item
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
        Name = 'PSex'
        Value = #39#1074#1110#1085' '#39
      end
      item
        Name = 'PKodSet1'
        Value = #39'01/08'#39
      end
      item
        Name = 'PKodSet2'
        Value = #39'06/08'#39
      end
      item
        Name = 'PSumMoney'
        Value = #39'6430,39 '#39
      end
      item
        Name = 'PSumAlimony'
        Value = #39'----- '#39
      end
      item
        Name = 'PSumInshi'
        Value = #39'2157,60 '#39
      end
      item
        Name = 'PWork'
        Value = 
          #39#1054#1089#1085#1086#1074#1085#1077' '#1084#1110#1089#1094#1077' '#1088#1086#1073#1086#1090#1080'. '#1053#1072#1074#1095#1072#1085#1085#1103': '#1057#1090#1091#1076#1077#1085#1090' ('#1073#1077#1079#1082#1086#1096#1090#1086#1074#1085#1077' '#1087#1086' '#1076#1077#1088#1078'. '#1079 +
          #1072#1082#1072#1079#1091') 4 '#1082#1091#1088#1089'   '#1052#1072#1090#1077#1084#1072#1090#1080#1095#1085#1080#1081' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#39
      end
      item
        Name = 'SumLetters'
        Value = #39#1074#1110#1089#1110#1084' '#1090#1080#1089'. '#1087#39#39#1103#1090#1089#1086#1090' '#1074#1110#1089#1110#1084#1076#1077#1089#1103#1090' '#1089#1110#1084' '#1075#1088#1085' 99 '#1082#1086#1087'.'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 30.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Height = 22.677165350000000000
        ParentFont = False
        Top = 510.236550000000000000
        Width = 642.520100000000000000
        DataSet = ReportDBDSet
        DataSetName = 'ReportDBDSet'
        KeepFooter = True
        KeepTogether = True
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 151.181102362205000000
          Height = 22.677165350000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.Strings = (
            '[PKOD_SETUP]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 151.181200000000000000
          Width = 151.181102362205000000
          Height = 22.677165350000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[PSUM_MONEY]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 302.362400000000000000
          Width = 188.976377950000000000
          Height = 22.677165350000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[PSUM_INSHI]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 491.338900000000000000
          Width = 151.181102360000000000
          Height = 22.677165350000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[PSUM_ALIMONY]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DetailData1: TfrxDetailData
        Height = 22.677180000000000000
        Top = 600.945270000000100000
        Width = 642.520100000000000000
        KeepTogether = True
        PrintIfDetailEmpty = True
        RowCount = 0
        object Memo24: TfrxMemoView
          Width = 642.520100000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight]
          Memo.Strings = (
            '[PSum_Vtch]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 381.732530000000000000
        Top = 18.897650000000000000
        Width = 642.520100000000000000
        Stretched = True
        object Memo43: TfrxMemoView
          Left = 132.283550000000000000
          Top = 3.779530000000001000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.Strings = (
            
              #1042#1083#1072#1089#1085#1080#1082' '#1087#1110#1076#1087#1088#1080#1108#1084#1089#1090#1074#1072', '#1091#1089#1090#1072#1085#1086#1074#1080', '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111' '#1072#1073#1086' '#1091#1087#1086#1074#1085#1086#1074#1072#1078#1077#1085#1080#1081' '#1086#1088 +
              #1075#1072#1085' ('#1085#1072#1074#1095#1072#1083#1100#1085#1080#1081' '#1079#1072#1082#1083#1072#1076')      <u><b>[ReportDBDSetFoundationData."' +
              'FULL_NAME_FIRM"]</u></b>')
        end
        object Memo44: TfrxMemoView
          Left = 132.283550000000000000
          Top = 26.456710000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            
              #1072#1073#1086' '#1092#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072'-'#1087#1110#1076#1087#1088#1080#1108#1084#1077#1094#1100' <u>                               ' +
              '                                                                ' +
              '                                           </u>')
        end
        object Memo45: TfrxMemoView
          Left = 132.283550000000000000
          Top = 68.031540000000010000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.Strings = (
            
              #1052#1110#1089#1094#1077#1079#1085#1072#1093#1086#1078#1076#1077#1085#1085#1103' <u><b> [ReportDBDSetFoundationData."TOWN"] [Rep' +
              'ortDBDSetFoundationData."ADRESS"] </b> '#1090#1077#1083'. <b>[ReportDBDSetFoun' +
              'dationData."TEL"]</b></u>')
        end
        object Memo46: TfrxMemoView
          Left = 132.283550000000000000
          Top = 91.488249999999990000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            
              #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059'   <u><b>[ReportDBDSetFoundationDa' +
              'ta."OKPO"]</b></u>')
        end
        object Memo47: TfrxMemoView
          Left = 132.283550000000000000
          Top = 109.606370000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            
              #1040#1073#1086' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088' '#1079#1072' '#1056#1044#1055#1040#1059' <u>                            ' +
              '                    </u>')
        end
        object Memo48: TfrxMemoView
          Left = 132.283550000000000000
          Top = 128.504020000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            #1044#1055#1030'     <u><b>[ReportDBDSetFoundationData."DPI"]</b></u>')
        end
        object Memo49: TfrxMemoView
          Left = 204.094620000000000000
          Top = 144.960730000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1079#1072' '#1084#1110#1089#1094#1077#1084' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111')')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Top = 235.330860000000000000
          Width = 642.519685039370000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1042#1080#1076#1072#1085#1072' '#1075#1088'. <u><b>[ReportDBDSetFoundationData."FIO"]</b> ('#1090#1072#1073'. '#1085#1086 +
              #1084#1077#1088' - [ReportDBDSetFoundationData."TN"])</u>')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Top = 253.228510000000000000
          Width = 642.519685039370000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1055#1088#1086' '#1090#1077', '#1097#1086' [PSex] '#1076#1110#1081#1089#1085#1086' '#1087#1088#1072#1094#1102#1108' '#1091' <u><b>[ReportDBDSetFoundationD' +
              'ata."FULL_NAME_FIRM"]([ReportDBDSetFoundationData."ADD_NAME"])</' +
              'b></u>')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Top = 196.535560000000000000
          Width = 642.519685039370000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1074#1110#1076#1082#1072' '#1087#1088#1086' '#1076#1086#1093#1086#1076#1080)
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Top = 292.803340000000000000
          Width = 642.519685039370000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.Strings = (
            #1092#1086#1088#1084#1072' '#1087#1088#1072#1094#1077#1074#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' ('#1085#1072#1074#1095#1072#1085#1085#1103') <u><b>[PWork]</b></u>')
        end
        object Memo54: TfrxMemoView
          Left = 3.779530000000000000
          Top = 311.811026060000000000
          Width = 381.732530000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              '('#1079#1072#1079#1085#1072#1095#1080#1090#1080' '#1086#1089#1085#1086#1074#1085#1077', '#1079#1072' '#1089#1091#1084#1110#1089#1085#1080#1094#1090#1074#1086#1084', '#1110#1085#1096#1077'; '#1085#1072#1074#1095#1072#1085#1085#1103' '#1087#1083#1072#1090#1085#1077'/'#1073#1077#1079#1087#1083 +
              #1072#1090#1085#1077')')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Top = 336.378170000000000000
          Width = 642.519685039370000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            
              #1079#1072#1081#1084#1072#1108' '#1087#1086#1089#1072#1076#1091' <u><b>[ReportDBDSetFoundationData."NAME_POST"]</u>' +
              '</b>')
        end
        object Memo56: TfrxMemoView
          Top = 355.275820000000000000
          Width = 642.519685039370000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            
              #1110#1085#1076#1080#1074#1110#1076#1091#1072#1083#1100#1085#1080#1081' '#1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088' <u><b>[ReportDBDSetFoundat' +
              'ionData."TIN"]</b></u>')
        end
        object Memo57: TfrxMemoView
          Left = 317.480520000000000000
          Top = 47.133889999999990000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086'-'#1073#1072#1090#1100#1082#1086#1074#1110')')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Top = 272.126160000000000000
          Width = 642.519685039370000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 253.228510000000000000
        Top = 684.094930000000000000
        Width = 642.520100000000000000
        object Memo26: TfrxMemoView
          Top = 3.102350000000001000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          HAlign = haCenter
          Memo.Strings = (
            
              #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1076#1086#1093#1086#1076#1091' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' <b>[PKodSet1]</b> '#1087#1086' <b>[PKodSe' +
              't2]</b> '#1079#1072' '#1074#1080#1085#1103#1090#1082#1086#1084' '#1072#1083#1110#1084#1077#1085#1090#1110#1074' '#1089#1090#1072#1085#1086#1074#1080#1090#1100)
        end
        object Memo27: TfrxMemoView
          Top = 22.000000000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          HAlign = haCenter
          Memo.Strings = (
            '<u><b>[SumLetters]</b></u>')
        end
        object Memo28: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.677180000000020000
          Width = 638.740570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1089#1091#1084#1072' '#1083#1110#1090#1077#1088#1072#1084#1080')')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Top = 59.795300000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            
              #1044#1086#1074#1110#1076#1082#1072' '#1074#1080#1076#1072#1085#1072' '#1076#1083#1103' '#1087#1086#1076#1072#1085#1085#1103' '#1076#1086' '#1086#1088#1075#1072#1085#1110#1074' '#1087#1088#1072#1094#1110' '#1090#1072' '#1089#1086#1094#1110#1072#1083#1100#1085#1086#1075#1086' '#1079#1072#1093#1080#1089 +
              #1090#1091' '#1085#1072#1089#1077#1083#1077#1085#1085#1103' '#1076#1083#1103' '#1086#1092#1086#1088#1084#1083#1077#1085#1085#1103' '#1089#1086#1094#1110#1072#1083#1100#1085#1086#1111' '#1076#1086#1087#1086#1084#1086#1075#1080' ('#1078#1080#1090#1083#1086#1074#1086#1111' '#1089#1091#1073#1089#1080#1076 +
              #1110#1111')')
        end
        object Memo30: TfrxMemoView
          Top = 86.252010000000040000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            
              #1056#1077#1082#1090#1086#1088'     <u>                                              </u>' +
              '  '#1055#1110#1076#1087#1080#1089)
        end
        object Memo32: TfrxMemoView
          Left = 49.133890000000000000
          Top = 124.047310000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            #1052'.'#1055'.')
        end
        object Memo33: TfrxMemoView
          Top = 150.504020000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            
              #1043#1086#1083'. '#1073#1091#1093#1075#1072#1083#1090#1077#1088'   <u>                                         </u' +
              '>  '#1055#1110#1076#1087#1080#1089)
        end
        object Memo36: TfrxMemoView
          Top = 203.417440000000100000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            
              #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100'      <u>                                            <' +
              '/u> '#1055#1110#1076#1087#1080#1089)
        end
        object Memo31: TfrxMemoView
          Left = 321.260050000000000000
          Top = 86.252010000000040000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          DataSet = ReportDBDSetFoundationData
          DataSetName = 'ReportDBDSetFoundationData'
          HAlign = haRight
          Memo.Strings = (
            '<b>(<u>[ReportDBDSetFoundationData."DIRECTOR"]</u>)</b>')
        end
        object Memo34: TfrxMemoView
          Left = 321.260050000000000000
          Top = 150.504020000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          DataSet = ReportDBDSetFoundationData
          DataSetName = 'ReportDBDSetFoundationData'
          HAlign = haRight
          Memo.Strings = (
            '<b>(<u>[ReportDBDSetFoundationData."GLBUHG"]</u>)</b>')
        end
        object Memo35: TfrxMemoView
          Left = 321.260050000000000000
          Top = 203.417440000000100000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          DataSet = ReportDBDSetFoundationData
          DataSetName = 'ReportDBDSetFoundationData'
          HAlign = haRight
          Memo.Strings = (
            
              '<b>(<u>                                                         ' +
              '     </u>)</b>'
            ' ')
        end
        object Memo42: TfrxMemoView
          Top = 230.551330000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              '" [DayOf(Now)] "   [P_MONTH]   [YearOf(Now)]  '#1088'.  '#8470'  [ReportDBDS' +
              'etFoundationData."N_SPRAVKI"]/[ReportDBDSetFoundationData."K_SPR' +
              '_BUHG"]/4')
        end
      end
      object Footer1: TfrxFooter
        Height = 23.897650000000000000
        Top = 555.590910000000000000
        Width = 642.520100000000000000
        Stretched = True
        object Memo5: TfrxMemoView
          Width = 151.181102360000000000
          Height = 23.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 151.181200000000000000
          Width = 151.181102360000000000
          Height = 23.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[PSumMoney]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 302.362400000000000000
          Width = 188.976377950000000000
          Height = 23.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[PSumInshi]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 491.338900000000000000
          Width = 151.181102360000000000
          Height = 23.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[PSumAlimony]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 27.897650000000000000
        Top = 461.102660000000000000
        Width = 642.520100000000000000
        Stretched = True
        object Memo8: TfrxMemoView
          Width = 151.181102362205000000
          Height = 27.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1110' '#1088#1086#1082#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 151.181200000000000000
          Width = 151.181102362205000000
          Height = 27.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1072' '#1079#1072#1088#1086#1073#1110#1090#1085#1072' '#1087#1083#1072#1090#1072', '#1074' '#1090'.'#1095'. '#1074' '#1085#1072#1090#1091#1088#1072#1083#1100#1085#1110#1081' '#1092#1086#1088#1084#1110' ('#1075#1088#1085'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 302.362400000000000000
          Width = 188.976377952756000000
          Height = 27.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1096#1110' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103', '#1074' '#1090'.'#1095'. '#1074' '#1085#1072#1090#1091#1088#1072#1083#1100#1085#1110#1081' '#1092#1086#1088#1084#1110' ('#1075#1088#1085'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 491.338900000000000000
          Width = 151.181102360000000000
          Height = 27.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1083#1072#1095#1077#1085#1110' '#1072#1083#1110#1084#1077#1085#1090#1080' ('#1075#1088#1085'.)')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object ReportDBDSet: TfrxDBDataset
    UserName = 'ReportDBDSet'
    CloseDataSource = False
    DataSet = DSet
    Left = 168
    Top = 48
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 104
  end
  object DSetFoundationData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 152
    poSQLINT64ToBCD = True
  end
  object ReportDBDSetFoundationData: TfrxDBDataset
    UserName = 'ReportDBDSetFoundationData'
    CloseDataSource = False
    DataSet = DSetFoundationData
    Left = 168
    Top = 152
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 264
    Top = 104
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 48
    Top = 200
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 160
    Top = 208
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 248
    Top = 208
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = ReadTransaction
    Left = 256
    Top = 32
  end
end
