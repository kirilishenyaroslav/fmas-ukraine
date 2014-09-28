object frmMainPrintDocChP: TfrmMainPrintDocChP
  Left = 373
  Top = 278
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1095#1072#1089#1090#1085#1099#1084' '#1087#1088#1077#1076#1087#1088#1080#1085#1080#1084#1072#1090#1077#1083#1103#1084
  ClientHeight = 368
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 349
    Width = 296
    Height = 19
    Panels = <>
  end
  object cxLabel1: TcxLabel
    Left = 3
    Top = 5
    Width = 166
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Caption = #1044#1080#1072#1087#1072#1079#1086#1085' '#1054#1050#1055#1054
  end
  object cxLabelBegin: TcxLabel
    Left = 23
    Top = 25
    Width = 16
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = 'c'
  end
  object cxLabel2: TcxLabel
    Left = 13
    Top = 48
    Width = 25
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = #1087#1086
  end
  object cxLabel3: TcxLabel
    Left = 0
    Top = 72
    Width = 187
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  end
  object cxLabel4: TcxLabel
    Left = 25
    Top = 92
    Width = 16
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = 'c'
  end
  object cxLabel5: TcxLabel
    Left = 15
    Top = 115
    Width = 25
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Caption = #1087#1086
  end
  object cxDateEditBegin: TcxDateEdit
    Left = 39
    Top = 88
    Width = 129
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 7
  end
  object cxDateEditEnd: TcxDateEdit
    Left = 39
    Top = 112
    Width = 129
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 8
  end
  object cxButtonOK: TcxButton
    Left = 88
    Top = 307
    Width = 75
    Height = 25
    Caption = #1054#1082
    TabOrder = 9
    OnClick = cxButtonOKClick
  end
  object cxButtonClose: TcxButton
    Left = 184
    Top = 307
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 10
    OnClick = cxButtonCloseClick
  end
  object RadioGroupTypeDoc: TRadioGroup
    Left = 8
    Top = 194
    Width = 281
    Height = 105
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      #1055#1088#1080#1073#1091#1090#1086#1082'\'#1042#1080#1076#1072#1090#1086#1082
      #1055#1088#1080#1073#1091#1090#1086#1082
      #1042#1080#1076#1072#1090#1086#1082)
    ParentFont = False
    TabOrder = 11
  end
  object cxMaskEditBegin: TcxMaskEdit
    Left = 39
    Top = 24
    Width = 129
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d+'
    Properties.MaxLength = 0
    Style.Color = clInfoBk
    TabOrder = 12
    Text = '000000001'
  end
  object cxMaskEditEnd: TcxMaskEdit
    Left = 39
    Top = 48
    Width = 129
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d+'
    Properties.MaxLength = 0
    Style.Color = clInfoBk
    TabOrder = 13
    Text = '999999999999'
  end
  object cxButtonEditRSPost: TcxButtonEdit
    Left = 5
    Top = 167
    Width = 284
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = False
    Properties.OnButtonClick = cxButtonEditRSPostPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 14
  end
  object cxLabel6: TcxLabel
    Left = 3
    Top = 144
    Width = 278
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 15
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 185
  end
  object pFIBDataSetPrint: TpFIBDataSet
    SelectSQL.Strings = (
      'select CLBANK_PRINT_DOC_PEOPLE.*'
      'from CLBANK_PRINT_DOC_PEOPLE(:param_date_beg,:param_date_end,'
      ':param_okpo_beg,:param_okpo_end)'
      
        'order by CLBANK_PRINT_DOC_PEOPLE.date_prov,CLBANK_PRINT_DOC_PEOP' +
        'LE.name')
    Left = 64
    Top = 185
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 24
    Top = 217
  end
  object frxDBDatasetPrint: TfrxDBDataset
    UserName = 'frxDBDatasetPrint'
    CloseDataSource = False
    DataSet = pFIBDataSetPrint
    Left = 64
    Top = 217
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38729.673046099500000000
    ReportOptions.LastChange = 40620.442674143520000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var s_1, s_2: double;'
      'procedure Memo7OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDatasetPrint."TYPE_DOC">=1 then'
      '    begin'
      '      Memo7.text:='#39#1055#1088#1080#1093#1086#1076#39';'
      '    end;'
      '  if <frxDBDatasetPrint."TYPE_DOC">=0 then'
      '    begin'
      '      Memo7.text:='#39#1056#1072#1089#1093#1086#1076#39';'
      '    end;'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   with MasterData1, Engine do'
      '  begin'
      '  if <frxDBDatasetPrint."TYPE_DOC">=1 then'
      '     s_1 := s_1 + <frxDBDatasetPrint."SUM_DOC">;'
      '   if <frxDBDatasetPrint."TYPE_DOC">=0 then'
      '     s_2 := s_2 + <frxDBDatasetPrint."SUM_DOC">;'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 96
    Top = 217
    Datasets = <
      item
        DataSet = frxDBDatasetPrint
        DataSetName = 'frxDBDatasetPrint'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 500.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 60.472480000000000000
        Width = 1814.174400000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDatasetPrint
        DataSetName = 'frxDBDatasetPrint'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Align = baLeft
          Left = 60.472480000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'OKPO'
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetPrint."OKPO"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baLeft
          Left = 188.976500000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetPrint."NAME"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Left = 483.779840000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DATE_PROV'
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDatasetPrint."DATE_PROV"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 589.606680000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NUMBER'
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDatasetPrint."NUMBER"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 676.535869999999900000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SUM_DOC'
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetPrint."SUM_DOC"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 755.905999999999900000
          Width = 880.630490000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NOTE'
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetPrint."NOTE"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 1636.536490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo7OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Line#]')
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 1814.174400000000000000
        Stretched = True
        object Memo8: TfrxMemoView
          Align = baLeft
          Left = 60.472480000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1050#1055#1054)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 188.976500000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 483.779840000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Left = 589.606680000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          Left = 676.535869999999900000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1084#1072)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          Left = 755.905999999999900000
          Width = 880.630490000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1089#1085#1086#1074#1072#1085#1080#1077)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          Left = 1636.536490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #8470)
        end
      end
      object Footer1: TfrxFooter
        Height = 83.149660000000000000
        Top = 102.047310000000000000
        Width = 1814.174400000000000000
        object Memo17: TfrxMemoView
          Left = 22.677180000000000000
          Top = 7.559060000000002000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1091#1084#1084#1072' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1091':')
        end
        object Memo18: TfrxMemoView
          Left = 22.677180000000000000
          Top = 41.574830000000010000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1091#1084#1084#1072' '#1087#1086' '#1088#1072#1089#1093#1086#1076#1091':')
        end
        object Memo19: TfrxMemoView
          Left = 177.637910000000000000
          Top = 7.559060000000002000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[s_1]')
        end
        object Memo20: TfrxMemoView
          Left = 177.637910000000000000
          Top = 41.574830000000010000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[s_2]')
        end
      end
    end
  end
  object frxDesigner: TfrxDesigner
    Restrictions = []
    Left = 128
    Top = 217
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    ShowProgress = True
    Left = 24
    Top = 249
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 56
    Top = 249
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 88
    Top = 249
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 120
    Top = 249
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 24
    Top = 281
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    Left = 56
    Top = 281
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 88
    Top = 281
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 120
    Top = 281
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
    Left = 24
    Top = 313
  end
end
