object DM: TDM
  OldCreateOrder = False
  Left = 387
  Top = 128
  Height = 230
  Width = 319
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
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38687.397620613400000000
    ReportOptions.LastChange = 38769.997674421300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '       DATE_BEG:String;'
      '       DATE_END:String;'
      ''
      '       FIRM_NAME:String;'
      '       CUR_DATE:String;'
      '       PEOPLE_TOTAL:Integer;'
      '       PROF_COUNT:Integer;'
      '       CANDIDATE_COUNT:Integer;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '       PEOPLE_TOTAL:=0;'
      '       PROF_COUNT:=0;'
      '       CANDIDATE_COUNT:=0;'
      ''
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   PEOPLE_TOTAL:=PEOPLE_TOTAL+1;'
      
        '   if (<ReportDsetData."IS_PROF">=1) then PROF_COUNT:=PROF_COUNT' +
        '+1;'
      
        '   if (<ReportDsetData."IS_CANDIDATE">=1) then CANDIDATE_COUNT:=' +
        'CANDIDATE_COUNT+1;'
      ''
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'end;'
      ''
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      ''
      ''
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
        Height = 96.031540000000000000
        Top = 16.000000000000000000
        Width = 980.410081999999900000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo1: TfrxMemoView
          Left = 461.102660000000000000
          Top = 27.779530000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1057#1055#1048#1057#1054#1050)
          ParentFont = False
        end
        object Line3: TfrxLineView
          Top = 96.031540000000010000
          Width = 982.680000000000000000
          Frame.Typ = [ftTop]
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
          Top = 30.236240000000000000
          Width = 152.740000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [CUR_DATE]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 256.567100000000000000
          Top = 50.456710000000000000
          Width = 268.787570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074', '#1087#1088#1080#1081#1085#1103#1090#1080#1093' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 525.354670000000000000
          Top = 50.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DATE_BEG]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 604.724800000000000000
          Top = 50.456710000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1087#1086)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 627.401980000000000000
          Top = 50.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DATE_END]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 827.717070000000000000
          Top = 3.779530000000001000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'21')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 280.567100000000000000
          Top = 73.133889999999990000
          Width = 445.984540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.Strings = (
            '[CATEGORY]')
          ParentFont = False
        end
      end
      object Line1: TfrxLineView
        Width = 982.677311810000000000
        Frame.Typ = [ftTop]
      end
      object Line2: TfrxLineView
        Top = 3.779530000000000000
        Width = 982.680000000000000000
        Frame.Typ = [ftTop]
      end
      object MasterData1: TfrxMasterData
        Height = 19.118120000000000000
        Top = 272.000000000000000000
        Width = 980.410081999999900000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo5: TfrxMemoView
          Left = 46.456710000000000000
          Width = 248.346630000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 390.390000000000000000
          Width = 176.540000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[ReportDsetData."POST_NAME"]')
        end
        object Memo13: TfrxMemoView
          Width = 46.460000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[Line#]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 294.803340000000000000
          Width = 95.590000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_SOVMEST"]')
        end
        object Memo16: TfrxMemoView
          Left = 566.929500000000000000
          Width = 154.960000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."REGARDS"]')
        end
        object Memo18: TfrxMemoView
          Left = 721.890000000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."DATE_ACC"]')
        end
        object Memo23: TfrxMemoView
          Left = 812.600000000000000000
          Width = 167.810000000000000000
          Height = 18.897650000000000000
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 45.800000000000000000
        Top = 132.000000000000000000
        Width = 980.410081999999900000
        object Memo7: TfrxMemoView
          Top = 3.779529999999994000
          Width = 46.456710000000000000
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
          Left = 46.456710000000000000
          Top = 3.779529999999994000
          Width = 248.346630000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 390.393940000000000000
          Top = 3.779529999999994000
          Width = 176.535560000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 294.803340000000000000
          Top = 3.779529999999994000
          Width = 95.590600000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 566.929500000000000000
          Top = 3.779529999999994000
          Width = 154.960730000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103','
            #1074#1095#1077#1085#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 721.890230000000000000
          Top = 3.779529999999994000
          Width = 90.708720000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1088#1080#1081#1086#1084#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 812.598950000000000000
          Top = 3.779529999999994000
          Width = 167.810000000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 460.000000000000000000
        Width = 980.410081999999900000
        object Memo32: TfrxMemoView
          Left = 867.496600000000000000
          Width = 111.401670000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1090#1086#1088'. [Page#]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 16.000000000000000000
        Top = 236.000000000000000000
        Width = 980.410081999999900000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        AllowSplit = True
        Condition = 'ReportDsetData."DEPARTMENT_NAME"'
        Stretched = True
        object Memo21: TfrxMemoView
          Width = 392.000000000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."DEPARTMENT_NAME_UPPER"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo22: TfrxMemoView
          Left = 392.000000000000000000
          Width = 588.000000000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."DEPARTMENT_NAME"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 20.000000000000000000
        Top = 312.000000000000000000
        Width = 980.410081999999900000
        Stretched = True
        object Memo24: TfrxMemoView
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1042#1089#1100#1075#1086' '#1092#1110#1079'. '#1086#1089#1110#1073':')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 120.944960000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          Memo.Strings = (
            '[PEOPLE_TOTAL]')
        end
        object Memo26: TfrxMemoView
          Left = 264.567100000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1044#1086#1082#1090#1086#1088#1110#1074' '#1085#1072#1091#1082', '#1087#1088#1086#1092#1077#1089#1086#1088#1110#1074':')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 457.323130000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          Memo.Strings = (
            '[PROF_COUNT]')
        end
        object Memo28: TfrxMemoView
          Left = 578.268090000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1050#1072#1085#1076#1080#1076#1072#1090#1110#1074' '#1085#1072#1091#1082', '#1076#1086#1094#1077#1085#1090#1110#1074':')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 774.803650000000000000
          Width = 207.880000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          Memo.Strings = (
            '[CANDIDATE_COUNT]')
        end
        object Line4: TfrxLineView
          ShiftMode = smDontShift
          Width = 982.680000000000000000
          Frame.Typ = [ftTop]
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 48.000000000000000000
        Top = 392.000000000000000000
        Width = 980.410081999999900000
        Stretched = True
        object Memo33: TfrxMemoView
          Top = 28.000000000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1042#1089#1100#1075#1086' '#1092#1110#1079'. '#1086#1089#1110#1073':')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 120.944960000000000000
          Top = 28.000000000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Memo.Strings = (
            '[Line#]')
        end
        object Memo35: TfrxMemoView
          Left = 264.567100000000000000
          Top = 28.000000000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1044#1086#1082#1090#1086#1088#1110#1074' '#1085#1072#1091#1082', '#1087#1088#1086#1092#1077#1089#1086#1088#1110#1074':')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 457.323130000000000000
          Top = 28.000000000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Memo.Strings = (
            '[SUM(<ReportDsetData."IS_PROF">,MasterData1,2)]')
        end
        object Memo37: TfrxMemoView
          Left = 578.268090000000000000
          Top = 28.000000000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1050#1072#1085#1076#1080#1076#1072#1090#1110#1074' '#1085#1072#1091#1082', '#1076#1086#1094#1077#1085#1090#1110#1074':')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 774.803650000000000000
          Top = 28.000000000000000000
          Width = 207.880000000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Memo.Strings = (
            '[SUM(<ReportDsetData."IS_CANDIDATE">,MasterData1,2)]')
        end
        object Memo39: TfrxMemoView
          Top = 8.000000000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1042#1089#1100#1075#1086' '#1087#1086' '#1042#1053#1047':')
          ParentFont = False
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 168
    Top = 43
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
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 256
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 256
    Top = 48
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 256
    Top = 96
  end
end
