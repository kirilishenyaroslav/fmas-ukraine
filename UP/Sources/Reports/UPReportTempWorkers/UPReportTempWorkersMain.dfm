object frmUPReportTempWorkersMain: TfrmUPReportTempWorkersMain
  Left = 193
  Top = 248
  Width = 420
  Height = 124
  Caption = #1057#1087#1080#1089#1086#1082' '#1090#1080#1084#1095#1072#1089#1086#1074#1086' '#1087#1088#1072#1094#1102#1102#1095#1080#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 71
    Width = 412
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 24
    Top = 24
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 144
    Top = 24
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    Enabled = False
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 264
    Top = 24
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1080#1093#1110#1076
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 48
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 16
    Top = 48
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 48
    Top = 48
  end
  object ActionList1: TActionList
    Left = 88
    Top = 48
    object FilterAction: TAction
      Caption = 'FilterAction'
      ShortCut = 16454
      OnExecute = FilterActionExecute
    end
    object PrintAction: TAction
      Caption = 'PrintAction'
      ShortCut = 121
      OnExecute = PrintActionExecute
    end
    object DesAction: TAction
      Caption = 'DesRep'
      ShortCut = 8315
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 216
    Top = 8
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
    ReportOptions.LastChange = 38786.014835601850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 184
    Top = 8
    Datasets = <
      item
      end
      item
      end
      item
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
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 280.000000000000000000
        Width = 718.110700000000000000
        KeepChild = True
        KeepTogether = True
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Color = 14737632
          DataField = 'NAME_DEPARTMENT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDSetDepartments."NAME_DEPARTMENT"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 140.000000000000000000
        Width = 718.110700000000000000
        PrintOnFirstPage = False
        object Memo10: TfrxMemoView
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [date]')
        end
        object Memo13: TfrxMemoView
          Left = 502.677490000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [<Page>] '#1079' [<TotalPages>]')
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 102.047310000000000000
        Top = 16.000000000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Left = 576.000000000000000000
          Top = 36.000000000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [date]')
        end
        object Memo12: TfrxMemoView
          Left = 502.677490000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [<Page>] '#1079' [<TotalPages>]')
        end
        object Memo14: TfrxMemoView
          Left = 623.622450000000000000
          Top = 18.897650000000000000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'8')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1080#1089#1077#1083#1100#1085#1110#1089#1090#1100)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Top = 60.472479999999990000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086#1092#1077#1089#1086#1088#1089#1100#1082#1086'-'#1074#1080#1082#1083#1072#1076#1072#1094#1100#1082#1086#1075#1086' '#1089#1082#1083#1072#1076#1091)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Top = 79.370130000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1074' '#1092#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1086#1073#1072#1093', '#1089#1090#1072#1074#1082#1072#1093)
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 37.795300000000000000
        Top = 224.000000000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo9: TfrxMemoView
          Left = 128.504020000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073)
        end
        object Memo16: TfrxMemoView
          Left = 226.771800000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1074#1086#1082)
        end
        object Memo21: TfrxMemoView
          Width = 128.504020000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1087#1088#1072#1094#1102#1102#1095#1086#1075#1086)
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 325.039580000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073)
        end
        object Memo18: TfrxMemoView
          Left = 423.307360000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1074#1086#1082)
        end
        object Memo19: TfrxMemoView
          Left = 521.575140000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073)
        end
        object Memo20: TfrxMemoView
          Left = 619.842920000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1074#1086#1082)
        end
        object Memo24: TfrxMemoView
          Left = 128.504020000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
        end
        object Memo26: TfrxMemoView
          Left = 325.039580000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1088#1072#1093#1091#1085#1086#1082' '#1073#1102#1076#1078#1077#1090#1085#1080#1093' '#1082#1086#1096#1090#1110#1074)
        end
        object Memo27: TfrxMemoView
          Left = 521.575140000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1088#1072#1093'. '#1087#1086#1079#1072#1073#1102#1076#1078#1077#1090#1085#1080#1093' '#1082#1086#1096#1090#1110#1074)
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 320.000000000000000000
        Width = 718.110700000000000000
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 128.504020000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_PEOPLE_ALL'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_PEOPLE_ALL"]')
        end
        object Memo2: TfrxMemoView
          Left = 226.771800000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_STAV_ALL'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_STAV_ALL"]')
        end
        object Memo3: TfrxMemoView
          Left = 325.039580000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_PEOPLE_BU'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_PEOPLE_BU"]')
        end
        object Memo4: TfrxMemoView
          Left = 521.575140000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_PEOPLE_N_BU'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_PEOPLE_N_BU"]')
        end
        object Memo5: TfrxMemoView
          Left = 619.842920000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_STAV_N_BU'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_STAV_N_BU"]')
        end
        object Memo6: TfrxMemoView
          Left = 423.307360000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'CNT_STAV_BU'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_STAV_BU"]')
        end
        object Memo8: TfrxMemoView
          Left = 75.590600000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'NAME_WORK_REASON'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_WORK_REASON"]')
        end
        object SysMemo1: TfrxSysMemoView
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[LINE#]')
        end
      end
      object Memo25: TfrxMemoView
        Top = 14.897650000000000000
        Width = 623.622450000000000000
        Height = 18.897650000000000000
        DataField = 'FIRM_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[ReportDsetGlobalData."FIRM_NAME"]')
        ParentFont = False
      end
    end
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 296
    Top = 44
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 328
    Top = 44
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DSourceDepartments
    Left = 296
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 328
    Top = 4
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 184
    Top = 43
    poSQLINT64ToBCD = True
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 232
    Top = 44
  end
  object DSetDepartments: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 248
    Top = 65531
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDSetDepartments: TfrxDBDataset
    UserName = 'ReportDSetDepartments'
    CloseDataSource = False
    DataSet = DSetDepartments
    Left = 360
    Top = 47
  end
  object DSourceDepartments: TDataSource
    DataSet = DSetDepartments
    Left = 368
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 264
    Top = 44
  end
end
