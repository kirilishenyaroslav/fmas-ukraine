object DM: TDM
  OldCreateOrder = False
  Left = 360
  Top = 214
  Height = 321
  Width = 340
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 24
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 24
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 24
    Top = 72
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.Author = #1054#1083#1077#1075' '#1043'. '#1042#1086#1083#1082#1086#1074' /qizz/'
    ReportOptions.CreateDate = 38303.769893194410000000
    ReportOptions.Name = #1054#1090#1095#1077#1090' '#1087#1086' '#1090#1072#1073#1077#1083#1102' '#1091#1095#1077#1090#1072' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080
    ReportOptions.LastChange = 38837.796394641220000000
    ReportOptions.VersionMajor = '2'
    ReportOptions.VersionMinor = '0'
    ReportOptions.VersionRelease = '1'
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 104
    Top = 96
    Datasets = <
      item
        DataSet = rDSet1
        DataSetName = 'rDSet1'
      end
      item
        DataSet = rDSet2
        DataSetName = 'rDSet2'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 404.440940000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo19: TfrxMemoView
          Left = 2.000000000000000000
          Top = 364.661410000000000000
          Width = 717.000000000000000000
          Height = 36.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1042' '#1057#1042#1071#1047#1048' '#1057' '#1059#1042#1054#1051#1068#1053#1045#1053#1048#1045#1052' '#1055#1056#1054#1057#1048#1052' '#1047#1040#1050#1056#1067#1058#1068' '#1047#1040#1056#1055#1051#1040#1058#1053#1067#1045' '#1055#1051#1040#1057#1058#1048#1050#1054#1042#1067#1045' '#1050#1040#1056#1058 +
              #1067' '#1057#1051#1045#1044#1059#1070#1065#1048#1052' '#1057#1054#1058#1056#1059#1044#1053#1048#1050#1040#1052':')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 122.000000000000000000
          Top = 5.102350000000000000
          Width = 96.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1059#1050#1056#1040#1031#1053#1040)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 82.000000000000000000
          Top = 24.102350000000000000
          Width = 184.000000000000000000
          Height = 48.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1088#1078#1072#1074#1085#1080#1081' '#1082#1086#1084#1110#1090#1077#1090
            #1073#1091#1076#1110#1074#1085#1080#1094#1090#1074#1072', '#1072#1088#1093#1110#1090#1077#1082#1090#1091#1088#1080
            #1090#1072' '#1078#1080#1090#1083#1086#1074#1086#1111' '#1087#1086#1083#1110#1090#1080#1082#1080)
        end
        object Memo3: TfrxMemoView
          Left = 22.000000000000000000
          Top = 84.102350000000000000
          Width = 308.000000000000000000
          Height = 87.338590000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1050#1054#1052#1059#1053#1040#1051#1068#1053#1045' '#1042#1048#1056#1054#1041#1053#1048#1063#1045' '#1055#1030#1044#1055#1056#1048#1028#1052#1058#1057#1042#1054' '#1044#1053#1030#1055#1056#1054#1044#1047#1045#1056#1046#1048#1053#1057#1068#1050#1054#1031' '#1052#1030#1057#1068#1050#1054#1031' '#1056#1040#1044 +
              #1048' "'#1044#1053#1030#1055#1056#1054#1044#1047#1045#1056#1046#1048#1053#1057#1068#1050#1042#1054#1044#1054#1050#1040#1053#1040#1051'"')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 86.000000000000000000
          Top = 183.440940000000000000
          Width = 184.000000000000000000
          Height = 48.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '51931, '#1084'. '#1044#1085#1110#1087#1088#1086#1076#1079#1077#1088#1078#1080#1085#1089#1100#1082','
            #1044#1085#1110#1087#1088#1086#1087#1077#1090#1088#1086#1074#1089#1100#1082#1086#1111' '#1086#1073#1083'.,'
            #1074#1091#1083'. '#1064#1080#1088#1086#1082#1072', 16')
        end
        object Memo5: TfrxMemoView
          Left = 262.000000000000000000
          Top = 232.102350000000000000
          Width = 229.354360000000000000
          Height = 48.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            #1090#1077#1083'. 3-03-01, '#1090#1077#1083'/'#1092#1072#1082#1089' 3-00-59'
            #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090' '#8470' 26004100074001'
            #1052#1060#1054' 305051, '#1080#1076#1077#1085#1090'. '#1082#1086#1076' 03341322')
        end
        object Memo6: TfrxMemoView
          Left = 14.000000000000000000
          Top = 287.881880000000000000
          Width = 184.000000000000000000
          Height = 32.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '_____________________ '#8470
            #1085#1072' '#8470)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 469.338590000000000000
          Top = 284.881880000000000000
          Width = 244.000000000000000000
          Height = 64.000000000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            #1044#1048#1056#1045#1050#1058#1054#1056#1059' '#1044#1053#1045#1055#1056#1054#1044#1047#1045#1056#1046#1048#1053#1057#1050#1054#1043#1054' '#1060#1048#1051#1048#1040#1051#1040' '#1055#1056#1048#1042#1040#1058#1041#1040#1053#1050#1040
            #1075'-'#1085#1091' '#1058#1091#1088#1086#1073#1086#1081#1089#1082#1086#1084#1091' '#1048'. '#1058'.')
        end
        object Memo8: TfrxMemoView
          Left = 510.000000000000000000
          Top = 5.102350000000000000
          Width = 96.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1059#1050#1056#1040#1048#1053#1040)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 470.000000000000000000
          Top = 24.102350000000000000
          Width = 184.000000000000000000
          Height = 48.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            
              #1043#1086#1089#1091#1076#1072#1088#1089#1090#1074#1077#1085#1085#1099#1081' '#1082#1086#1084#1080#1090#1077#1090' '#1089#1090#1088#1086#1080#1090#1077#1083#1100#1089#1090#1074#1072', '#1072#1088#1093#1080#1090#1077#1082#1090#1091#1088#1099' '#1080' '#1078#1080#1083#1080#1097#1085#1086#1081' '#1087#1086 +
              #1083#1080#1090#1080#1082#1080)
        end
        object Memo10: TfrxMemoView
          Left = 413.779530000000000000
          Top = 85.039306610000000000
          Width = 308.000000000000000000
          Height = 88.220470000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1050#1054#1052#1059#1053#1040#1051#1068#1053#1054#1045' '#1055#1056#1054#1048#1047#1042#1054#1044#1057#1058#1042#1045#1053#1053#1054#1045' '#1055#1056#1045#1044#1055#1056#1048#1071#1058#1048#1045' '#1044#1053#1045#1055#1056#1054#1044#1047#1045#1056#1046#1048#1053#1057#1050#1054#1043#1054' '#1043#1054#1056#1054 +
              #1044#1057#1050#1054#1043#1054' '#1057#1054#1042#1045#1058#1040' "'#1044#1053#1045#1055#1056#1054#1044#1047#1045#1056#1046#1048#1053#1057#1050#1042#1054#1044#1054#1050#1040#1053#1040#1051'"')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 474.000000000000000000
          Top = 183.440940000000000000
          Width = 184.000000000000000000
          Height = 48.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '51931, '#1084'. '#1044#1085#1110#1087#1088#1086#1076#1079#1077#1088#1078#1080#1085#1089#1100#1082','
            #1044#1085#1110#1087#1088#1086#1087#1077#1090#1088#1086#1074#1089#1100#1082#1086#1111' '#1086#1073#1083'.,'
            #1074#1091#1083'. '#1064#1080#1088#1086#1082#1072', 16')
        end
        object Picture1: TfrxPictureView
          Left = 342.000000000000000000
          Top = 13.102350000000000000
          Width = 52.000000000000000000
          Height = 76.000000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        Height = 98.401626060000000000
        Top = 548.031850000000000000
        Width = 755.906000000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = rDSet1
        DataSetName = 'rDSet1'
        RowCount = 0
        Stretched = True
        object Memo18: TfrxMemoView
          Left = 45.779530000000000000
          Top = 0.031496059999999990
          Width = 192.000000000000000000
          Height = 18.897637795275600000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[rDSet1."FAMILIA"]')
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 237.732283464567000000
          Top = 0.031496059999999990
          Width = 134.645640000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[rDSet1."IMYA"]')
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.031496059999999990
          Width = 42.000000000000000000
          Height = 18.897637795275600000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[LINE#]')
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 372.283464566929000000
          Top = 0.031496059999999990
          Width = 167.322820000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[rDSet1."OTCHESTVO"]')
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 538.582677165354300000
          Top = 0.031496059999999990
          Width = 79.763760000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[rDSet1."TN"]')
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 618.330708661417300000
          Width = 132.677180000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[rDSet1."ACCT_CARD"]')
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 131.118120000000000000
        Top = 706.772110000000000000
        Width = 755.906000000000000000
        object Memo12: TfrxMemoView
          Left = 50.000000000000000000
          Top = 2.613790000000000000
          Width = 40.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            #1052'. '#1055'.')
        end
        object Memo13: TfrxMemoView
          Left = 6.000000000000000000
          Top = 34.613790000000000000
          Width = 152.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[rDSet2."NAME_MANEG"]')
        end
        object Memo14: TfrxMemoView
          Left = 6.000000000000000000
          Top = 70.613790000000000000
          Width = 154.236240000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[rDSet2."GLBUHG_POST"]')
        end
        object Memo15: TfrxMemoView
          Left = 462.000000000000000000
          Top = 34.613790000000000000
          Width = 152.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[rDSet2."DIRECTOR"]')
        end
        object Memo16: TfrxMemoView
          Left = 462.000000000000000000
          Top = 70.613790000000000000
          Width = 152.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[rDSet2."GLAV_BUHG"]')
        end
        object Memo25: TfrxMemoView
          Left = 6.047244090000000000
          Top = 105.826840000000000000
          Width = 154.236240000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[rDSet2."NACH_OK_POST"]')
        end
        object Memo26: TfrxMemoView
          Left = 461.858267720000000000
          Top = 105.826840000000000000
          Width = 152.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[rDSet2."NACH_OK"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 43.086614170000000000
        Top = 445.984540000000000000
        Width = 755.906000000000000000
        object Memo27: TfrxMemoView
          Left = 4.000000000000000000
          Top = 22.928880000000000000
          Width = 42.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'/'#1087)
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 46.000000000000000000
          Top = 22.928880000000000000
          Width = 192.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1060#1072#1084#1080#1083#1080#1103)
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 237.732283464567000000
          Top = 22.928880000000000000
          Width = 134.645640000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1048#1084#1103)
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 372.283464566929000000
          Top = 22.928880000000000000
          Width = 167.322820000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1054#1090#1095#1077#1089#1090#1074#1086)
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 538.582677165354300000
          Top = 22.928880000000000000
          Width = 79.763760000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1058#1072#1073'. '#1085#1086#1084#1077#1088)
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 618.330708661417300000
          Top = 23.055118110000000000
          Width = 132.283550000000000000
          Height = 20.031496060000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1082#1072#1088#1090#1086#1095#1082#1080)
          VAlign = vaCenter
        end
      end
    end
  end
  object rDSet1: TfrxDBDataset
    UserName = 'rDSet1'
    CloseDataSource = False
    DataSet = DSet1
    Left = 64
    Top = 72
  end
  object rDSet2: TfrxDBDataset
    UserName = 'rDSet2'
    CloseDataSource = False
    DataSet = DSet2
    Left = 64
    Top = 120
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 24
    Top = 121
    poSQLINT64ToBCD = True
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 24
    Top = 184
  end
end
