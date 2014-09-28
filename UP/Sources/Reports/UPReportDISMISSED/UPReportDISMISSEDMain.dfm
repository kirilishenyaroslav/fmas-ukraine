object frmUPReportDISMISSEDMain: TfrmUPReportDISMISSEDMain
  Left = 337
  Top = 267
  Width = 490
  Height = 123
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074', '#1103#1082#1110' '#1074#1080#1073#1091#1083#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076' ('#1092#1086#1088#1084#1072' '#8470'22)'
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
    Top = 70
    Width = 482
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 128
    Top = 24
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 248
    Top = 24
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    Enabled = False
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 368
    Top = 24
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1080#1093#1110#1076
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 8
    Top = 24
    Width = 110
    Height = 25
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 4
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 96
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 128
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 48
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 128
    Top = 48
  end
  object ActionList1: TActionList
    Left = 168
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
    object FontAction: TAction
      Caption = 'FontAction'
      ShortCut = 8262
      OnExecute = FontActionExecute
    end
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
    ReportOptions.LastChange = 39036.900161493060000000
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
    Left = 256
    Top = 24
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 176.472480000000000000
        Top = 18.897650000000000000
        Width = 1046.920361175000000000
        object Memo7: TfrxMemoView
          Left = 4.000000000000000000
          Width = 674.110000000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[NameV]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 892.000000000000000000
          Top = 20.000000000000000000
          Width = 156.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470' 58')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Align = baCenter
          Left = 1.460180587499849000
          Top = 128.000000000000000000
          Width = 1044.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1085#1072' [dates] '#1088'.')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baCenter
          Left = 1.460180587499849000
          Top = 80.000000000000000000
          Width = 1044.000000000000000000
          Height = 48.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1042' '#1045' '#1044' '#1045' '#1053' '#1030'   '#1044' '#1040' '#1053' '#1030
            #1087#1088#1086' '#1089#1082#1083#1072#1076' '#1087#1077#1085#1089#1110#1086#1085#1077#1088#1110#1074' '#1087#1086' '#1082#1072#1092#1077#1076#1088#1072#1093', '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072#1093' '#1110' '#1042#1053#1047)
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 892.000000000000000000
          Width = 156.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072' : [date]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 36.000000000000000000
        Top = 257.008040000000000000
        Width = 1046.920361175000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 5.000000000000000000
          Width = 250.000000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1072#1092#1077#1076#1088)
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 467.811380000000000000
          Width = 105.385900000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1086#1092#1077#1089#1086#1088#1080)
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 382.620000000000000000
          Width = 85.690000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1074'. '#1082#1072#1092'.')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 255.000000000000000000
          Width = 127.622140000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1082#1072#1085#1080'/'#1079#1072#1089#1090'. '#1076#1077#1082'.  '#1082#1077#1088'. '#1087#1110#1076#1088#1086#1079#1076'.')
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 573.000000000000000000
          Width = 72.000000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1094#1077#1085#1090#1080)
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 645.000000000000000000
          Width = 199.000000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090'. '#1074#1080#1082#1083'./'#1074#1080#1082#1083'./'#1072#1089#1080#1089#1090#1077#1085#1090' '#1079' '#1074#1095#1077#1085#1080#1084' '#1089#1090#1091#1087#1077#1085#1077#1084)
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 844.380000000000000000
          Width = 202.160000000000000000
          Height = 34.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090'. '#1074#1080#1082#1083'./'#1074#1080#1082#1083'./'#1072#1089#1080#1089#1090#1077#1085#1090' '#1073#1077#1079' '#1074#1095#1077#1085#1086#1075#1086' '#1089#1090#1091#1087#1077#1085#1102)
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 525.354670000000100000
        Width = 1046.920361175000000000
        object Memo4: TfrxMemoView
          Left = 942.677490000000000000
          Width = 103.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.900000000000000000
        Top = 362.834880000000000000
        Width = 1046.920361175000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 5.000000000000000000
          Width = 250.000000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftRight]
          Memo.Strings = (
            '[ReportDsetData."NAME_CAFEDRA"]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 573.000000000000000000
          Width = 72.000000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_DOC"]')
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 382.620000000000000000
          Width = 85.690000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_ZAV_CAF"]')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 255.000000000000000000
          Width = 127.620000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_DEC_ZDEC"]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 467.810000000000000000
          Width = 105.390000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_PROF"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 645.000000000000000000
          Width = 199.000000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_SPR_PR_AS_UCH"]')
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 844.380000000000000000
          Width = 202.160000000000000000
          Height = 18.900000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_SPR_PR_AS_NUCH"]')
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 24.000000000000000000
        ParentFont = False
        Top = 317.480520000000000000
        Width = 1046.920361175000000000
        Condition = 'ReportDsetData."NAME_FACULTY"'
        object Memo1: TfrxMemoView
          Left = 144.000000000000000000
          Width = 904.000000000000000000
          Height = 20.000000000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."NAME_FACULTY"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 4.000000000000000000
          Width = 140.000000000000000000
          Height = 20.000000000000000000
          Memo.Strings = (
            '                                         ')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 20.000000000000000000
        ParentFont = False
        Top = 404.409710000000000000
        Width = 1046.920361175000000000
        object Memo2: TfrxMemoView
          Left = 24.000000000000000000
          Width = 232.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 255.000000000000000000
          Width = 127.620000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_DEC_ZDEC">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 382.620000000000000000
          Width = 85.690000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_ZAV_CAF">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 467.810000000000000000
          Width = 105.390000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_PROF">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 573.000000000000000000
          Width = 72.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_DOC">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 645.000000000000000000
          Width = 199.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_SPR_PR_AS_UCH">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 844.380000000000000000
          Width = 202.160000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_SPR_PR_AS_NUCH">,MasterData1)]')
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 20.000000000000000000
        Top = 483.779840000000000000
        Width = 1046.920361175000000000
        object Memo23: TfrxMemoView
          Left = 24.000000000000000000
          Width = 232.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1087#1086' '#1042#1053#1047':')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 255.000000000000000000
          Width = 127.620000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_DEC_ZDEC">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 382.620000000000000000
          Width = 85.690000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_ZAV_CAF">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 467.810000000000000000
          Width = 105.390000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_PROF">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 573.000000000000000000
          Width = 72.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_DOC">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 645.000000000000000000
          Width = 199.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_SPR_PR_AS_UCH">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 844.380000000000000000
          Width = 202.160000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_SPR_PR_AS_NUCH">,MasterData1)]')
          VAlign = vaCenter
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 288
    Top = 25
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 286
    Top = 55
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 414
    Top = 50
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 448
    Top = 50
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 320
    Top = 55
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 322
    Top = 24
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 382
    Top = 51
    poSQLINT64ToBCD = True
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 254
    Top = 55
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object FontDialogs: TFontDialog
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    Left = 64
    Top = 48
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
    Left = 360
    Top = 16
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 424
    Top = 8
  end
end
