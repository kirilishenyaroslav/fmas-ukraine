object DM: TDM
  OldCreateOrder = False
  Left = 75
  Top = 180
  Height = 273
  Width = 356
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
    Top = 60
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 152
    Top = 59
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 184
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 152
    Top = 180
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 115
    poSQLINT64ToBCD = True
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 152
    Top = 116
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
    Top = 60
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 256
    Top = 116
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 39027.618506215280000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var PLine:integer=0;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PLine:=0;'
      'end;'
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  inc(Pline);'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 152
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
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PSpisok'
        Value = #39#1057#1055#1048#1057#1054#1050' '#1050#1040#1053#1044#1048#1044#1040#1058#1030#1042' '#1053#1040#1059#1050#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 232.472480000000000000
        Top = 16.000000000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo3: TfrxMemoView
          Width = 131.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[date]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baCenter
          Left = 130.000000000000000000
          Top = 153.795300000000000000
          Width = 458.110700000000000000
          Height = 54.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1103#1082#1110' '#1087#1110#1076#1083#1103#1075#1072#1102#1090#1100' '#1087#1077#1088#1110#1086#1076#1080#1095#1085#1086#1084#1091' '#1084#1077#1076#1080#1095#1085#1086#1084#1091' '#1086#1075#1083#1103#1076#1091' '#1074' [year] '#1088#1086#1094#1110
            
              #1091' '#1079#1074#39#1103#1079#1082#1091' '#1079' '#1076#1110#1103#1083#1100#1085#1110#1089#1090#1102', '#1103#1082#1072' '#1087#1086#1074#39#1103#1079#1072#1085#1072' '#1079' '#1086#1073#1089#1083#1091#1075#1086#1074#1091#1074#1072#1085#1085#1103#1084' '#1085#1072#1089#1077#1083#1077#1085#1085 +
              #1103','
            #1079#1075#1110#1076#1085#1086' '#1085#1072#1082#1072#1079#1091' '#1052#1047' '#1059#1082#1088#1072#1111#1085#1080' '#8470'280 '#1074#1110#1076' 23.07.2002 '#1088'.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 22.897650000000000000
          Width = 210.110000000000000000
          Height = 50.897650000000000000
          StretchMode = smActualHeight
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1059#1047#1043#1054#1044#1046#1045#1053#1054':'
            '[ReportDsetGlobalData."glav_vrach"]'
            '         [ReportDsetGlobalData."glav_vrach_familia"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 548.000000000000000000
          Width = 168.000000000000000000
          Height = 84.000000000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1047#1040#1058#1042#1045#1056#1044#1046#1059#1070':'
            ''
            '[ReportDsetGlobalData."prorector"]'
            ''
            '"......"...........................[year] '#1088'.')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baCenter
          Left = 1.055349999999976000
          Top = 208.000000000000000000
          Width = 716.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetGlobalData."name_customer"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baCenter
          Left = 243.055350000000000000
          Top = 128.000000000000000000
          Width = 232.000000000000000000
          Height = 28.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1057#1055#1048#1057#1054#1050' '#1055#1056#1040#1062#1030#1042#1053#1048#1050#1030#1042)
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 30.236240000000000000
        Top = 308.000000000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 36.460000000000000000
          Width = 238.980000000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 603.811380000000000000
          Width = 114.300000000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 527.055350000000000000
          Width = 76.756030000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1089#1090#1072#1085#1085#1108' '#1084#1077#1076#1086#1073#1089#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 359.433210000000000000
          Width = 167.622140000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 36.460000000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 275.440000000000000000
          Width = 84.000000000000000000
          Height = 30.240000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072
            #1085#1072#1088#1086#1076#1078'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 480.000000000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          Left = 642.677490000000000000
          Width = 75.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsUnderline]
        Height = 18.900000000000000000
        ParentFont = False
        Top = 360.000000000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."NAME_CAFEDRA"'
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 359.000000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_FACULTY"]')
          SuppressRepeated = True
        end
        object Memo5: TfrxMemoView
          Left = 359.000000000000000000
          Width = 359.110000000000000000
          Height = 18.900000000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_CAFEDRA"]')
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.900000000000000000
        ParentFont = False
        Top = 400.000000000000000000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 36.460000000000000000
          Width = 238.980000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 527.059999999999900000
          Width = 76.760000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_VUT"]')
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Width = 36.460000000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Pline]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 603.810000000000000000
          Width = 114.300000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 275.440000000000000000
          Width = 84.000000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."BIRTH_DATE"]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 359.430000000000000000
          Width = 167.620000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_POST"]')
          VAlign = vaCenter
        end
      end
    end
  end
  object DSetDep: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 256
    Top = 180
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
end
