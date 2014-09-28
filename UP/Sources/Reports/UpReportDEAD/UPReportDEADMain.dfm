object frmUPReportDEADMain: TfrmUPReportDEADMain
  Left = 317
  Top = 267
  Width = 505
  Height = 120
  Caption = #1047#1074#1110#1090' '#1079#1072' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1072#1084#1080', '#1097#1086' '#1074#1080#1073#1091#1083#1080' '#1079' '#1087#1088#1080#1095#1080#1085#1080' '#1089#1084#1077#1088#1090#1110' ('#1092#1086#1088#1084#1072' '#8470'23)'
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
    Top = 63
    Width = 489
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 129
    Top = 24
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 249
    Top = 24
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    Enabled = False
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 369
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
    Left = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 40
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 48
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 144
    Top = 48
  end
  object ActionList1: TActionList
    Left = 184
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
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38702.345258599500000000
    ReportOptions.LastChange = 41232.791732442130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' DateNow:String;'
      ' DateBeg:String;'
      ' DateEnd:String;'
      ' NameV  :String;'
      ''
      'procedure Memo33OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '    if (Length(<ReportDsetData."UCH_ZVANIE">)<>0) and (Length(<R' +
        'eportDsetData."UCH_STEPEN">)<>0) then'
      '    begin'
      
        '        Memo33.Text:=<ReportDsetData."UCH_ZVANIE">+'#39','#39'+<ReportDs' +
        'etData."UCH_STEPEN">;'
      '    end;'
      
        '    if (Length(<ReportDsetData."UCH_ZVANIE">)<>0) and (Length(<R' +
        'eportDsetData."UCH_STEPEN">)=0) then'
      '    begin'
      '        Memo33.Text:=<ReportDsetData."UCH_ZVANIE">;'
      '    end;'
      
        '    if (Length(<ReportDsetData."UCH_ZVANIE">)=0) and (Length(<Re' +
        'portDsetData."UCH_STEPEN">)<>0) then'
      '    begin'
      '        Memo33.Text:=<ReportDsetData."UCH_STEPEN">;'
      '    end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 272
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
        Name = 'NameV'
        Value = #39#1044#1054#1053#1045#1062#1068#1050#1048#1049' '#1053#1040#1062#1030#1054#1053#1040#1051#1068#1053#1048#1049' '#1059#1053#1030#1042#1045#1056#1057#1048#1058#1045#1058#39
      end
      item
        Name = 'DateNow'
        Value = #39'27.12.2005'#39
      end
      item
        Name = 'DateBeg'
        Value = #39'27.12.2005'#39
      end
      item
        Name = 'DateEnd'
        Value = #39'27.12.2005'#39
      end>
    Style = <>
    object Page2: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle2: TfrxReportTitle
        Height = 158.740260000000000000
        Top = 22.677180000000000000
        Width = 1046.929810000000000000
        object Memo20: TfrxMemoView
          Left = 132.283550000000000000
          Top = 11.338590000000000000
          Width = 789.921770000000000000
          Height = 60.472480000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[NameV]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 306.141930000000000000
          Top = 71.811070000000000000
          Width = 457.323130000000000000
          Height = 83.149660000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1087#1080#1089#1086#1082' '#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074' , '#1074#1080#1073#1091#1083#1080#1093'  '#1085#1072' '#1087#1110#1076#1089#1090#1072#1074#1110' '#1089#1084#1077#1088#1090#1110
            
              #1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' [ReportDsetData."OUT_PERIOD_BEG"] '#1087#1086' [ReportDsetData' +
              '."OUT_PERIOD_END"] '#1088#1088'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Memo3: TfrxMemoView
        Left = 805.039890000000000000
        Top = 7.559060000000000000
        Width = 241.889920000000000000
        Height = 18.897650000000000000
        HAlign = haRight
        Memo.Strings = (
          #1055#1086#1090#1086#1095#1085#1072' '#1076#1072#1090#1072' [Date]')
      end
      object PageHeader2: TfrxPageHeader
        Height = 52.913420000000000000
        Top = 207.874150000000000000
        Width = 1046.929810000000000000
        object Line3: TfrxLineView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 1039.370750000000000000
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 3.779530000000000000
          Top = 45.354360000000000000
          Width = 1039.370750000000000000
          Frame.Typ = [ftTop]
        end
        object Memo22: TfrxMemoView
          Left = 34.015770000000000000
          Top = 7.559059999999990000
          Width = 294.803340000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1055)
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999990000
          Width = 30.236240000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 328.819110000000000000
          Top = 7.559059999999990000
          Width = 94.488250000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1089#1085'. '#1088#1072#1073'.')
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 423.307360000000000000
          Top = 7.559060000000000000
          Width = 136.063080000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 559.370440000000000000
          Top = 7.559059999999990000
          Width = 120.944960000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103','
            #1074#1095#1077#1085#1072' '#1089#1090#1091#1087#1110#1085#1100)
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 680.315400000000000000
          Top = 7.559059999999990000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1079#1074#1110#1083#1100#1085#1077#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 793.701300000000000000
          Top = 7.559060000000000000
          Width = 249.448980000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090#1072#1074#1072)
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 37.795300000000000000
        ParentFont = False
        Top = 283.464750000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo29: TfrxMemoView
          Left = 34.015770000000000000
          Width = 294.803340000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 328.819110000000000000
          Width = 94.488250000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."WORK_REASON"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 423.307360000000000000
          Width = 136.063080000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."POST_NAME"]')
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 559.370440000000000000
          Width = 120.944960000000000000
          Height = 34.015770000000000000
          OnBeforePrint = 'Memo33OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 680.315400000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DATE_DISM"]')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 793.701300000000000000
          Width = 249.448980000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."DISMISSION_REASON"]')
          VAlign = vaCenter
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 347.716760000000000000
        Width = 1046.929810000000000000
        object Memo36: TfrxMemoView
          Left = 948.662030000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1057#1090#1086#1088#1110#1085#1082#1072' [Page#]')
          ParentFont = False
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 304
    Top = 1
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 302
    Top = 55
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 438
    Top = 53
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 472
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
    Left = 448
    Top = 65535
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 338
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 406
    Top = 53
    poSQLINT64ToBCD = True
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 270
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
    Left = 416
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 384
  end
end
