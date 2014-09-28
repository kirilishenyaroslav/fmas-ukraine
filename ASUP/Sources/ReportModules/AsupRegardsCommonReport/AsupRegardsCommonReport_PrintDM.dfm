object DM: TDM
  OldCreateOrder = False
  Left = 381
  Top = 241
  Height = 223
  Width = 333
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
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
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 93
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 144
    Top = 92
  end
  object DSourceData: TDataSource
    DataSet = DSetData
    Left = 248
    Top = 140
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
    Left = 144
    Top = 140
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38687.397620613400000000
    ReportOptions.LastChange = 38766.939844652780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '       NATIONALITY:String;'
      '       FIRM_NAME:String;'
      '       CUR_DATE:String;'
      '       TotalMan:Integer;'
      '       ShtatMan:Integer;'
      '       REGARD_NAME:String;'
      'procedure Memo13OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '       Inc(TotalMan);'
      '       if <ReportDsetData."ID_REASON">=1 then Inc(ShtatMan);'
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  TotalMan:=0;'
      '  ShtatMan:=0;'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 144
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
        Value = #39'20.12.2005'#39
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
        Height = 68.031540000000000000
        Top = 16.000000000000000000
        Width = 980.410081999999900000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo1: TfrxMemoView
          Left = 445.984540000000000000
          Top = 19.779530000000000000
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
          Top = 68.031540000000010000
          Width = 982.677800000000000000
          Frame.Typ = [ftTop]
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000001000
          Width = 336.378170000000000000
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
          Left = 816.378480000000000000
          Top = 3.779530000000001000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1055#1086#1090#1086#1095'. '#1076#1072#1090#1072':[CUR_DATE]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 340.157700000000000000
          Top = 38.677180000000000000
          Width = 422.141930000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1084#1072#1102#1090#1100' [REGARD_NAME]')
          ParentFont = False
        end
      end
      object Line1: TfrxLineView
        Width = 978.897781810000000000
        Frame.Typ = [ftTop]
      end
      object Line2: TfrxLineView
        Top = 3.779530000000000000
        Width = 982.677800000000000000
        Frame.Typ = [ftTop]
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 296.000000000000000000
        Width = 980.410081999999900000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 34.460000000000000000
          Top = 3.779530000000022000
          Width = 240.570000000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo13OnBeforePrint'
          StretchMode = smActualHeight
          DataSetName = 'FRDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 449.764070000000000000
          Top = 3.779530000000022000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Memo.Strings = (
            '[ReportDsetData."POST_NAME"]')
        end
        object Memo18: TfrxMemoView
          Top = 3.779530000000022000
          Width = 34.460000000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[Line#]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 275.020000000000000000
          Top = 3.779530000000022000
          Width = 80.250000000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Memo.Strings = (
            '[ReportDsetData."WORK_REASON"]')
        end
        object Memo11: TfrxMemoView
          Left = 355.275820000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Memo.Strings = (
            '[ReportDsetData."DATE_BIRTH"]')
        end
        object Memo12: TfrxMemoView
          Left = 665.197280000000000000
          Top = 3.779530000000022000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."REGARDS"]')
        end
        object Memo15: TfrxMemoView
          Left = 884.410020000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Memo.Strings = (
            '[ReportDsetData."YEAR_REGARD"]')
        end
        object Line4: TfrxLineView
          Width = 891.969080000000000000
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 891.969080000000000000
          Width = 90.708720000000000000
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 42.677180000000000000
        Top = 104.000000000000000000
        Width = 980.410081999999900000
        object Memo7: TfrxMemoView
          Top = 3.779529999999994000
          Width = 34.456710000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 34.456710000000000000
          Top = 3.779529999999994000
          Width = 240.567100000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 449.764070000000000000
          Top = 3.779529999999994000
          Width = 215.433210000000000000
          Height = 37.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 275.023810000000000000
          Top = 3.779529999999994000
          Width = 80.252010000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080)
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 665.197280000000000000
          Top = 3.779529999999994000
          Width = 219.212740000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1079#1074#1072#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 355.275820000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078'.')
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 884.410020000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 37.800000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1110#1082' '#1085#1072#1075#1086#1088#1086#1076#1078'.')
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 256.000000000000000000
        Width = 980.410081999999900000
        Condition = 'ReportDsetData."DEPARTMENT_NAME_UPPER"'
        ReprintOnNewPage = True
        object Memo21: TfrxMemoView
          Width = 978.898270000000000000
          Height = 15.118120000000000000
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Memo.Strings = (
            '[ReportDsetData."DEPARTMENT_NAME_UPPER"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 428.000000000000000000
        Width = 980.410081999999900000
        object Memo17: TfrxMemoView
          Left = 831.496600000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1090#1086#1088'. [Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 384.000000000000000000
        Width = 980.410081999999900000
        object Memo16: TfrxMemoView
          Left = 79.370130000000000000
          Width = 107.464750000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1042#1089#1100#1075#1086': [TotalMan]')
        end
        object Memo23: TfrxMemoView
          Left = 192.000000000000000000
          Width = 168.000000000000000000
          Height = 18.900000000000000000
          OnAfterPrint = 'Memo23OnAfterPrint'
          OnBeforePrint = 'Memo23OnBeforePrint'
          Memo.Strings = (
            '('#1079' '#1085#1080#1093' '#1096#1090#1072#1090#1085#1080#1093':[ShtatMan])')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 28.000000000000000000
        Top = 208.000000000000000000
        Width = 980.410081999999900000
        Condition = 'ReportDsetData."WORK_REASON"'
        object Memo22: TfrxMemoView
          Top = 4.000000000000000000
          Width = 980.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WORK_REASON"]')
          ParentFont = False
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 144
    Top = 48
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 248
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 248
    Top = 48
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 248
    Top = 96
  end
end
