object frmPrintSubs: TfrmPrintSubs
  Left = 717
  Top = 331
  Width = 323
  Height = 214
  Caption = #1044#1088#1091#1082
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
    Top = 161
    Width = 315
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 111
    Width = 315
    Height = 50
    Align = alBottom
    TabOrder = 1
    object ButtonPrint: TcxButton
      Left = 88
      Top = 17
      Width = 99
      Height = 25
      Caption = 'ButtonPrint'
      Default = True
      TabOrder = 0
      OnClick = ButtonPrintClick
    end
    object ButtonClose: TcxButton
      Left = 192
      Top = 16
      Width = 99
      Height = 25
      Cancel = True
      Caption = 'ButtonClose'
      TabOrder = 1
      OnClick = ButtonCloseClick
    end
  end
  object RadioGroupPrintOtdelSubs: TRadioGroup
    Left = 0
    Top = 0
    Width = 315
    Height = 111
    Align = alClient
    TabOrder = 2
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38452.680822118000000000
    ReportOptions.LastChange = 38454.540625902800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 16
    Top = 16
    Datasets = <
      item
        DataSet = frxDBDatasetPrintMaster
        DataSetName = 'frxDBDatasetPrintMaster'
      end
      item
        DataSet = frxDBDatasetPrintDetails
        DataSetName = 'frxDBDatasetPrintDetails'
      end>
    Variables = <
      item
        Name = 'DateList'
        Value = '01.10.2000'
      end
      item
        Name = 'NameReport1'
        Value = #1056#1077#1077#1089#1090#1088' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093' '#1074' '#1086#1073#1097#1077#1078#1080#1090#1080#1103#1093' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1082#1072','
      end
      item
        Name = 'NameReport2'
        Value = #1087#1086#1083#1091#1095#1080#1074#1096#1080#1093' '#1078#1080#1083#1080#1097#1085#1091#1102' '#1089#1091#1073#1089#1080#1076#1080#1102' '#1085#1072' '
      end
      item
        Name = 'NameReport3'
        Value = '('#1089' '#1091#1095#1077#1090#1086#1084' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1086#1074')'
      end
      item
        Name = 'Number'
        Value = #8470'/'#8470
      end
      item
        Name = 'FIO'
        Value = #1060'.'#1048'.'#1054'.'
      end
      item
        Name = 'FakKurs'
        Value = #1060#1072#1082#1091#1083'.  '#1050#1091#1088#1089
      end
      item
        Name = 'BuildsRoom'
        Value = #1054#1073#1097#1077#1078#1080#1090#1080#1077' '#1082#1086#1084#1085#1072#1090#1072
      end
      item
        Name = 'Summa'
        Value = #1057#1091#1084#1084#1072' '#1085#1072#1079#1085'. '#1089#1091#1073#1089#1080#1076#1080#1080', '#1075#1088#1085
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[Date]')
        end
        object Memo8: TfrxMemoView
          Top = 22.677180000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[NameReport1]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Top = 45.354360000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[NameReport2] [DATELIST]')
        end
        object Memo10: TfrxMemoView
          Top = 68.031540000000010000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[NameReport3]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 52.913420000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetPrintMaster
        DataSetName = 'frxDBDatasetPrintMaster'
        RowCount = 0
        object Memo1: TfrxMemoView
          Top = 7.559059999999988000
          Width = 718.110577950000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TEXT_REPORT_R'
          DataSet = frxDBDatasetPrintMaster
          DataSetName = 'frxDBDatasetPrintMaster'
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDatasetPrintMaster."TEXT_REPORT_R"]')
          VAlign = vaCenter
        end
      end
      object DetailData1: TfrxDetailData
        Height = 22.677180000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetPrintDetails
        DataSetName = 'frxDBDatasetPrintDetails'
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 53.472480000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrintDetails
          DataSetName = 'frxDBDatasetPrintDetails'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '[frxDBDatasetPrintDetails."FAMILIA"] [frxDBDatasetPrintDetails."' +
              'IMYA"] [frxDBDatasetPrintDetails."OTCHESTVO"]')
        end
        object Memo3: TfrxMemoView
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[Line#]')
        end
        object Memo4: TfrxMemoView
          Left = 333.598640000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrintDetails
          DataSetName = 'frxDBDatasetPrintDetails'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '[frxDBDatasetPrintDetails."SHORT_BUILDS"]    [frxDBDatasetPrintD' +
              'etails."ROOM"]')
        end
        object Memo5: TfrxMemoView
          Left = 472.441250000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrintDetails
          DataSetName = 'frxDBDatasetPrintDetails'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '[frxDBDatasetPrintDetails."ID_FAK"] [frxDBDatasetPrintDetails."K' +
              'URS"]')
        end
        object Memo6: TfrxMemoView
          Left = 585.827150000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SUMMA_SUBS'
          DataSet = frxDBDatasetPrintDetails
          DataSetName = 'frxDBDatasetPrintDetails'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetPrintDetails."SUMMA_SUBS"]')
        end
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 16
    Top = 80
  end
  object pFIBDataSetPrintMaster: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from ST_DT_REPORT_SUBSOTDEL_WORK_M(:id_tr,:type_work)')
    Left = 56
    Top = 48
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetPrintMaster: TfrxDBDataset
    UserName = 'frxDBDatasetPrintMaster'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintMaster
    Left = 16
    Top = 48
  end
  object frxDBDatasetPrintDetails: TfrxDBDataset
    UserName = 'frxDBDatasetPrintDetails'
    CloseDataSource = False
    DataSet = pFIBDataSetprintDetails
    Left = 96
    Top = 48
  end
  object pFIBDataSetprintDetails: TpFIBDataSet
    DataSource = DataSourceMaster
    Left = 128
    Top = 48
    poSQLINT64ToBCD = True
  end
  object DataSourceMaster: TDataSource
    DataSet = pFIBDataSetPrintMaster
    Left = 56
    Top = 80
  end
  object ActionList1: TActionList
    Left = 192
    Top = 80
    object ActionDesigned: TAction
      Caption = 'ActionDesigned'
      ShortCut = 57412
      OnExecute = ActionDesignedExecute
    end
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 240
    Top = 185
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    Left = 280
    Top = 185
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 320
    Top = 185
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 320
    Top = 217
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 280
    Top = 217
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 240
    Top = 217
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 280
    Top = 249
  end
  object frxRTFExport2: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 195
    Top = 13
  end
  object frxBMPExport2: TfrxBMPExport
    UseFileCache = True
    Left = 235
    Top = 13
  end
  object frxHTMLExport2: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 275
    Top = 13
  end
  object frxPDFExport2: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 275
    Top = 45
  end
  object frxJPEGExport2: TfrxJPEGExport
    UseFileCache = True
    Left = 235
    Top = 45
  end
  object frxXLSExport2: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 195
    Top = 45
  end
  object frxTIFFExport2: TfrxTIFFExport
    UseFileCache = True
    Left = 235
    Top = 77
  end
end
