object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 839
  Top = 460
  Height = 439
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
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbTools, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 40399.650469398200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      ''
      'begin'
      ' if (<TotalPages>>1)'
      '       then'
      '        begin'
      '         Memo21.Visible:=true;'
      '         Memo8.Font.Size:=8;'
      '         Memo9.Font.Size:=8;'
      '         Memo10.Font.Size:=8;'
      '         Memo11.Font.Size:=8;'
      '         Memo8.Height:=1.04;'
      '         Memo9.Height:=1.04;'
      '         Memo10.Height:=1.04;'
      '         Memo11.Height:=1.04;'
      '         Memo1.Font.Size:=8;'
      '         Memo2.Font.Size:=8;'
      '         Memo3.Font.Size:=8;'
      '         Memo4.Font.Size:=8;'
      '         Memo1.Height:=0.40;'
      '         Memo2.Height:=0.40;'
      '         Memo3.Height:=0.40;'
      '         Memo4.Height:=0.40;'
      '         Memo5.Font.Size:=8;'
      '         Memo6.Font.Size:=8;'
      '         Memo7.Font.Size:=8;'
      '         Memo12.Font.Size:=8;'
      '         Memo24.Font.Size:=8;'
      '         Memo17.Font.Size:=8;'
      '         Memo18.Font.Size:=8;'
      '         Memo19.Font.Size:=8;'
      '         Memo20.Font.Size:=8;'
      '         Memo14.Font.Size:=8;'
      '         Memo15.Font.Size:=8;'
      '         Memo16.Font.Size:=8;'
      '{         Memo17.Height:=0.45;'
      '         Memo18.Height:=0.45;'
      '         Memo19.Height:=0.45;'
      '         Memo20.Height:=0.45;'
      '         Memo14.Height:=0.45;'
      '         Memo15.Height:=0.45;'
      '         Memo16.Height:=0.45;}'
      '        end;'
      'if (<ReportDBDSetFoundationData."STUD_SHIFR">=0)'
      ' then'
      
        ' Memo50.Memo.Text:='#39#1042#1080#1076#1072#1085#1072' '#1075#1088'. <u><b>[ReportDBDSetFoundationData' +
        '."FIO"]</b> ('#1090#1072#1073'. '#1085#1086#1084#1077#1088' - [ReportDBDSetFoundationData."TN"]/'#1089#1090#1091#1076 +
        '. '#1096#1080#1092#1088' ---)</u>'#39';'
      'if (<ReportDBDSetFoundationData."TN">=0)'
      ' then'
      
        ' Memo50.Memo.Text:='#39#1042#1080#1076#1072#1085#1072' '#1075#1088'. <u><b>[ReportDBDSetFoundationData' +
        '."FIO"]</b> ('#1090#1072#1073'. '#1085#1086#1084#1077#1088' ---/'#1089#1090#1091#1076'. '#1096#1080#1092#1088' - [ReportDBDSetFoundation' +
        'Data."STUD_SHIFR"])</u>'#39';'
      
        'if (<ReportDBDSetFoundationData."TN">=0) and (<ReportDBDSetFound' +
        'ationData."STUD_SHIFR">=0)'
      ' then'
      
        ' Memo50.Memo.Text:='#39#1042#1080#1076#1072#1085#1072' '#1075#1088'. <u><b>[ReportDBDSetFoundationData' +
        '."FIO"]</b> ('#1090#1072#1073'. '#1085#1086#1084#1077#1088' ---/'#1089#1090#1091#1076'. '#1096#1080#1092#1088' ---)</u>'#39
      'else'
      
        ' Memo50.Memo.Text:='#39#1042#1080#1076#1072#1085#1072' '#1075#1088'. <u><b>[ReportDBDSetFoundationData' +
        '."FIO"]</b> ('#1090#1072#1073'. '#1085#1086#1084#1077#1088' - [ReportDBDSetFoundationData."TN"]/'#1089#1090#1091#1076 +
        '. '#1096#1080#1092#1088' - [ReportDBDSetFoundationData."STUD_SHIFR"])</u>'#39';'
      ''
      ' if'
      ' <ReportDBDSetFoundationData."TIN"><=0'
      ' then'
      '   if <ReportDBDSetFoundationData."ID_SEX">=1'
      
        '   then Memo56.Memo.Text:='#39#1110#1085#1076#1080#1074#1110#1076#1091#1072#1083#1100#1085#1080#1081' '#1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088 +
        ' <u><b>'#1074#1110#1076#1084#1086#1074#1080#1074#1089#1103' '#1074#1110#1076' '#1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1086#1075#1086' '#1085#1086#1084#1077#1088#1072'</b></u>'#39
      
        '   else Memo56.Memo.Text:='#39#1110#1085#1076#1080#1074#1110#1076#1091#1072#1083#1100#1085#1080#1081' '#1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088 +
        ' <u><b>'#1074#1110#1076#1084#1086#1074#1080#1083#1072#1089#1100' '#1074#1110#1076' '#1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1086#1075#1086' '#1085#1086#1084#1077#1088#1072'</b></u>'#39
      'end;'
      ''
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
        DataSet = ReportDBDSetDetail
        DataSetName = 'ReportDBDSetDetail'
      end
      item
        DataSet = ReportDBDSetFoundationData
        DataSetName = 'ReportDBDSetFoundationData'
      end
      item
        DataSet = ReportDSetAcadem
        DataSetName = 'ReportDSetAcadem'
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
        Value = #39'10/09'#39
      end
      item
        Name = 'PKodSet2'
        Value = #39'03/10'#39
      end
      item
        Name = 'PSumMoney'
        Value = #39'15889,67 '#39
      end
      item
        Name = 'PSumAlimony'
        Value = #39'----- '#39
      end
      item
        Name = 'PSumInshi'
        Value = #39'3626,64 '#39
      end
      item
        Name = 'PWork'
        Value = 
          #39#1054#1089#1085#1086#1074#1085#1077' '#1084#1110#1089#1094#1077' '#1088#1086#1073#1086#1090#1080'. '#1053#1072#1074#1095#1072#1085#1085#1103': '#1057#1090#1091#1076#1077#1085#1090' ('#1073#1077#1079#1082#1086#1096#1090#1086#1074#1085#1077' '#1087#1086' '#1076#1077#1088#1078'. '#1079 +
          #1072#1082#1072#1079#1091')   5 '#1082#1091#1088#1089'  '#1052#1072#1090#1077#1084#1072#1090#1080#1095#1085#1080#1081' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#39
      end
      item
        Name = 'SumLetters'
        Value = #39#1076#1077#1074#39#39#1103#1090#1085#1072#1076#1094#1103#1090#1100' '#1090#1080#1089'. '#1087#39#39#1103#1090#1089#1086#1090' '#1096#1110#1089#1090#1085#1072#1076#1094#1103#1090#1100' '#1075#1088#1085' 31 '#1082#1086#1087'.'#39
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
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        Height = 22.677165350000000000
        ParentFont = False
        Top = 525.354670000000000000
        Width = 642.520100000000000000
        DataSet = ReportDBDSet
        DataSetName = 'ReportDBDSet'
        KeepFooter = True
        KeepTogether = True
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 151.181102360000000000
          Height = 22.677165350000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.Strings = (
            '[PKOD_SETUP]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 151.181200000000000000
          Width = 151.181102360000000000
          Height = 22.677165350000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
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
          Font.Name = 'Courier New'
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
          Font.Name = 'Courier New'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 616.063390000000000000
        Width = 642.520100000000000000
        DataSet = ReportDBDSetDetail
        DataSetName = 'ReportDBDSetDetail'
        KeepTogether = True
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Memo24: TfrxMemoView
          Width = 642.520100000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight]
          Memo.Strings = (
            
              #1074' '#1090'.'#1095'.: [ReportDBDSetDetail."NAME_VOPL"]  [FormatFloat('#39'0.00'#39',<R' +
              'eportDBDSetDetail."SUMMA">)]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Height = 396.850650000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 642.520100000000000000
        Stretched = True
        object Memo43: TfrxMemoView
          Left = 207.874150000000000000
          Top = 3.779530000000000000
          Width = 434.645950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1042#1083#1072#1089#1085#1080#1082' '#1087#1110#1076#1087#1088#1080#1108#1084#1089#1090#1074#1072', '#1091#1089#1090#1072#1085#1086#1074#1080', '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111' '#1072#1073#1086' '#1091#1087#1086#1074#1085#1086#1074#1072#1078#1077#1085#1080#1081' '#1086#1088 +
              #1075#1072#1085' ('#1085#1072#1074#1095#1072#1083#1100#1085#1080#1081' '#1079#1072#1082#1083#1072#1076') <u><b>[ReportDBDSetFoundationData."FULL_' +
              'NAME_FIRM"]</u></b>')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 207.874150000000000000
          Top = 26.456710000000000000
          Width = 434.645950000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1072#1073#1086' '#1092#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072'-'#1087#1110#1076#1087#1088#1080#1108#1084#1077#1094#1100' <u>                               ' +
              '                                                                ' +
              '                                           </u>')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 207.874150000000000000
          Top = 68.031540000000000000
          Width = 434.645950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1052#1110#1089#1094#1077#1079#1085#1072#1093#1086#1078#1076#1077#1085#1085#1103' <u><b> [ReportDBDSetFoundationData."TOWN"] [Rep' +
              'ortDBDSetFoundationData."ADRESS"] </b></u>')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 207.874150000000000000
          Top = 110.385900000000000000
          Width = 434.645950000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059'   <u><b>[ReportDBDSetFoundationDa' +
              'ta."OKPO"]</b></u>')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 207.874150000000000000
          Top = 128.504020000000000000
          Width = 434.645950000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1040#1073#1086' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088' '#1079#1072' '#1056#1044#1055#1040#1059' <u>                            ' +
              '                    </u>')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 207.874150000000000000
          Top = 147.401670000000000000
          Width = 434.645950000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1044#1055#1030'     <u><b>[ReportDBDSetFoundationData."DPI"]</b></u>')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 268.346630000000000000
          Top = 163.858380000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1079#1072' '#1084#1110#1089#1094#1077#1084' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111')')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Top = 258.008040000000000000
          Width = 642.519685040000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Top = 275.905690000000000000
          Width = 642.519685040000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1055#1088#1086' '#1090#1077', '#1097#1086' [PSex] '#1076#1110#1081#1089#1085#1086' '#1087#1088#1072#1094#1102#1108' '#1091' <u><b>[ReportDBDSetFoundationD' +
              'ata."FULL_NAME_FIRM_R"]([ReportDBDSetFoundationData."ADD_NAME"])' +
              '</b></u>')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Top = 219.212740000000000000
          Width = 642.519685040000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1074#1110#1076#1082#1072' '#1087#1088#1086' '#1076#1086#1093#1086#1076#1080)
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Top = 315.480520000000000000
          Width = 642.519685040000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1092#1086#1088#1084#1072' '#1087#1088#1072#1094#1077#1074#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' ('#1085#1072#1074#1095#1072#1085#1085#1103') <u><b>[PWork]</b></u>')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 3.779530000000000000
          Top = 334.488206060000000000
          Width = 445.984540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              '('#1079#1072#1079#1085#1072#1095#1080#1090#1080' '#1086#1089#1085#1086#1074#1085#1077', '#1079#1072' '#1089#1091#1084#1110#1089#1085#1080#1094#1090#1074#1086#1084', '#1110#1085#1096#1077'; '#1085#1072#1074#1095#1072#1085#1085#1103' '#1087#1083#1072#1090#1085#1077'/'#1073#1077#1079#1087#1083 +
              #1072#1090#1085#1077')')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Top = 359.055350000000000000
          Width = 642.519685040000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1079#1072#1081#1084#1072#1108' '#1087#1086#1089#1072#1076#1091' <u><b>[ReportDBDSetFoundationData."NAME_POST"]</u>' +
              '</b>')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Top = 377.953000000000000000
          Width = 642.519685040000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1110#1085#1076#1080#1074#1110#1076#1091#1072#1083#1100#1085#1080#1081' '#1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088' <u><b>[ReportDBDSetFoundat' +
              'ionData."TIN"]</b></u>')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 423.307360000000000000
          Top = 47.133890000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086'-'#1073#1072#1090#1100#1082#1086#1074#1110')')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Top = 294.803340000000000000
          Width = 642.519685040000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 207.874150000000000000
          Top = 86.929190000000000000
          Width = 434.645950000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.Strings = (
            #1090#1077#1083'. <u><b>[ReportDBDSetFoundationData."TEL"]</b></u>')
        end
      end
      object Footer1: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Height = 23.897650000000000000
        ParentFont = False
        Top = 570.709030000000000000
        Width = 642.520100000000000000
        Stretched = True
        object Memo5: TfrxMemoView
          Width = 151.181102360000000000
          Height = 23.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
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
          Font.Name = 'Courier New'
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
          Font.Name = 'Courier New'
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
          Font.Name = 'Courier New'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Height = 27.897650000000000000
        ParentFont = False
        Top = 476.220780000000000000
        Width = 642.520100000000000000
        Stretched = True
        object Memo8: TfrxMemoView
          Width = 151.181102360000000000
          Height = 27.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
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
          Width = 151.181102360000000000
          Height = 27.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
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
          Width = 188.976377950000000000
          Height = 27.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
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
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1083#1072#1095#1077#1085#1110' '#1072#1083#1110#1084#1077#1085#1090#1080' ('#1075#1088#1085'.)')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 714.331170000000000000
        Width = 642.520100000000000000
        DataSet = ReportDSetAcadem
        DataSetName = 'ReportDSetAcadem'
        RowCount = 0
        object Memo14: TfrxMemoView
          Width = 453.543404720000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'PRIKAZ'
          DataSet = ReportDSetAcadem
          DataSetName = 'ReportDSetAcadem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDSetAcadem."PRIKAZ"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 548.031850000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DATE_END'
          DataSet = ReportDSetAcadem
          DataSetName = 'ReportDSetAcadem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDSetAcadem."DATE_END"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 453.543600000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DATE_BEG'
          DataSet = ReportDSetAcadem
          DataSetName = 'ReportDSetAcadem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDSetAcadem."DATE_BEG"]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        Height = 37.795300000000000000
        Top = 653.858690000000000000
        Width = 642.520100000000000000
        object Memo17: TfrxMemoView
          Top = 18.897650000000000000
          Width = 453.543600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1082#1072#1079)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 453.543600000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1095#1072#1090#1086#1082)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 548.031850000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1040#1082#1072#1076#1077#1084#1110#1095#1085#1110' '#1074#1110#1076#1087#1091#1089#1090#1082#1080':')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 1062.047930000000000000
        Width = 642.520100000000000000
        PrintOnLastPage = False
        object Memo21: TfrxMemoView
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.Strings = (
            
              #1044#1086#1074#1110#1076#1082#1072' '#1074#1110#1076' " [DayOf(Now)] "   [P_MONTH]   [YearOf(Now)]  '#1088'.  '#8470' ' +
              ' [ReportDBDSetFoundationData."N_SPRAVKI"]/[ReportDBDSetFoundatio' +
              'nData."K_SPR_BUHG"]/4')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Height = 246.346630000000000000
        ParentFont = False
        Top = 793.701300000000000000
        Width = 642.520100000000000000
        object Memo22: TfrxMemoView
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1076#1086#1093#1086#1076#1091' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' <b>[PKodSet1]</b> '#1087#1086' <b>[PKodSe' +
              't2]</b> '#1079#1072' '#1074#1080#1085#1103#1090#1082#1086#1084' '#1072#1083#1110#1084#1077#1085#1090#1110#1074' '#1089#1090#1072#1085#1086#1074#1080#1090#1100)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Top = 18.897650000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '<u><b>[SumLetters]</b></u>')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 3.779530000000000000
          Top = 34.574830000000000000
          Width = 638.740570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1089#1091#1084#1072' '#1083#1110#1090#1077#1088#1072#1084#1080')')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Top = 56.692950000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1044#1086#1074#1110#1076#1082#1072' '#1074#1080#1076#1072#1085#1072' '#1076#1083#1103' '#1087#1086#1076#1072#1085#1085#1103' '#1076#1086' '#1086#1088#1075#1072#1085#1110#1074' '#1087#1088#1072#1094#1110' '#1090#1072' '#1089#1086#1094#1110#1072#1083#1100#1085#1086#1075#1086' '#1079#1072#1093#1080#1089 +
              #1090#1091' '#1085#1072#1089#1077#1083#1077#1085#1085#1103' '#1076#1083#1103' '#1086#1092#1086#1088#1084#1083#1077#1085#1085#1103' '#1089#1086#1094#1110#1072#1083#1100#1085#1086#1111' '#1076#1086#1087#1086#1084#1086#1075#1080' ('#1078#1080#1090#1083#1086#1074#1086#1111' '#1089#1091#1073#1089#1080#1076 +
              #1110#1111')')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 109.606370000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              '[ReportDBDSetFoundationData."name_maneg"]     <u>               ' +
              '                               </u>  '#1055#1110#1076#1087#1080#1089)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 49.133890000000000000
          Top = 136.063080000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1052'.'#1055'.')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Top = 158.740260000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1043#1086#1083'. '#1073#1091#1093#1075#1072#1083#1090#1077#1088'   <u>                                         </u' +
              '>  '#1055#1110#1076#1087#1080#1089)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Top = 200.315090000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100'      <u>                                            <' +
              '/u> '#1055#1110#1076#1087#1080#1089)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 321.260050000000000000
          Top = 109.606370000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          DataSet = ReportDBDSetFoundationData
          DataSetName = 'ReportDBDSetFoundationData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '<b>(<u>[ReportDBDSetFoundationData."DIRECTOR"]</u>)</b>')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 321.260050000000000000
          Top = 158.740260000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          DataSet = ReportDBDSetFoundationData
          DataSetName = 'ReportDBDSetFoundationData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '<b>(<u>[ReportDBDSetFoundationData."GLBUHG"]</u>)</b>')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 321.260050000000000000
          Top = 200.315090000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          DataSet = ReportDBDSetFoundationData
          DataSetName = 'ReportDBDSetFoundationData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '<b>(<u>[USER]</u>)</b>'
            ' ')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Top = 227.448980000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1044#1086#1074#1110#1076#1082#1072' '#1074#1110#1076' " [DayOf(Now)] "   [P_MONTH]   [YearOf(Now)]  '#1088'.  '#8470' ' +
              ' [ReportDBDSetFoundationData."N_SPRAVKI"]/[ReportDBDSetFoundatio' +
              'nData."K_SPR_BUHG"]/4')
          ParentFont = False
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
    Left = 272
    Top = 144
  end
  object DSetDetail: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSource
    Left = 40
    Top = 200
    poSQLINT64ToBCD = True
  end
  object ReportDBDSetDetail: TfrxDBDataset
    UserName = 'ReportDBDSetDetail'
    CloseDataSource = False
    DataSet = DSetDetail
    Left = 168
    Top = 208
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 272
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 272
    Top = 48
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 272
    Top = 96
  end
  object DSetAcadem: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSource
    Left = 40
    Top = 264
    poSQLINT64ToBCD = True
  end
  object ReportDSetAcadem: TfrxDBDataset
    UserName = 'ReportDSetAcadem'
    CloseDataSource = False
    DataSet = DSetAcadem
    Left = 160
    Top = 264
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = DefaultTransaction
    Left = 264
    Top = 216
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 336
  end
end
