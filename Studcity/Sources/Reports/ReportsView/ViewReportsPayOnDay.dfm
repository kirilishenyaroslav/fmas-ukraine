object frmMainPayOnDay: TfrmMainPayOnDay
  Left = 658
  Top = 529
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 395
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridDB: TcxGrid
    Left = 0
    Top = 0
    Width = 297
    Height = 161
    TabOrder = 0
    object cxGridDBDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourceDB
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyleYellow
      Styles.Selection = cxStyleMalin
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object CxSelectField: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 20
        DataBinding.FieldName = 'RxSelectField'
        IsCaptionAssigned = True
      end
      object CxNameField: TcxGridDBColumn
        Options.Editing = False
        Width = 76
        DataBinding.FieldName = 'RxNameField'
        IsCaptionAssigned = True
      end
      object RxNameVariant: TcxGridDBColumn
        Caption = #1044#1077#1073#1077#1090#1086#1074#1099#1077' '#1089#1095#1077#1090#1072
        Options.Editing = False
        Width = 199
        DataBinding.FieldName = 'RxNameVariant'
      end
    end
    object cxGridDBLevel1: TcxGridLevel
      GridView = cxGridDBDBTableView1
    end
  end
  object cxGridCR: TcxGrid
    Left = 304
    Top = 0
    Width = 297
    Height = 161
    TabOrder = 1
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourceCR
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyleYellow
      Styles.Selection = cxStyleMalin
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGridDBColumn1: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 20
        DataBinding.FieldName = 'RxSelectField'
        IsCaptionAssigned = True
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Options.Editing = False
        Width = 76
        DataBinding.FieldName = 'RxNameField'
        IsCaptionAssigned = True
      end
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1099#1077' '#1089#1095#1077#1090#1072
        Options.Editing = False
        Width = 199
        DataBinding.FieldName = 'RxNameVariant'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object cxGridSM: TcxGrid
    Left = 0
    Top = 168
    Width = 601
    Height = 169
    TabOrder = 2
    object cxGridDBTableView2: TcxGridDBTableView
      DataController.DataSource = DataSourceSM
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyleYellow
      Styles.Selection = cxStyleMalin
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGridDBColumn4: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 20
        DataBinding.FieldName = 'RxSelectField'
        IsCaptionAssigned = True
      end
      object cxGridDBColumn5: TcxGridDBColumn
        Caption = #1057#1084'\'#1056#1072#1079#1076'\'#1057#1090'\'#1050#1045#1050#1042
        Options.Editing = False
        Width = 76
        DataBinding.FieldName = 'RxNameField'
      end
      object cxGridDBColumn6: TcxGridDBColumn
        Caption = #1057#1084#1077#1090#1072
        Options.Editing = False
        Width = 199
        DataBinding.FieldName = 'RxNameVariant'
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxGridDBTableView2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 376
    Width = 606
    Height = 19
    Panels = <>
  end
  object cxButtonOK: TcxButton
    Left = 432
    Top = 344
    Width = 75
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    TabOrder = 4
    OnClick = cxButtonOKClick
  end
  object cxButtonCancel: TcxButton
    Left = 512
    Top = 344
    Width = 83
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = cxButtonCancelClick
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 256
    Top = 176
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 288
    Top = 176
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 256
    Top = 208
  end
  object pFIBStoredProcSaveRX: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 288
    Top = 208
  end
  object DataSourceMaster: TDataSource
    DataSet = pFIBDataSetPrintMaster
    Left = 368
    Top = 184
  end
  object pFIBDataSetPrintMaster: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 400
    Top = 184
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetMaster: TfrxDBDataset
    UserName = 'frxDBDatasetMaster'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintMaster
    Left = 432
    Top = 184
  end
  object pFIBDataSetPrintDetail: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    DataSource = DataSourceMaster
    Left = 400
    Top = 216
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetDetails: TfrxDBDataset
    UserName = 'frxDBDatasetDetails'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintDetail
    Left = 432
    Top = 216
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 400
    Top = 248
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38516.665087581000000000
    ReportOptions.LastChange = 38742.657857777780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  FIO_LAST:String;'
      '  LineFIO:Integer;'
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FIO_LAST:='#39#39';'
      '  LineFIO:=1;'
      'end;'
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDatasetDetails."FIO">= FIO_LAST then'
      '    begin'
      '      Memo1.text:='#39#39';'
      '      TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight;'
      '      MemoLine.Text:='#39#39';'
      '      MemoLine.Frame.Typ :=ftLeft + ftRight;'
      '    end'
      '    else'
      '    begin'
      '      Memo1.text:=<frxDBDatasetDetails."FIO">;'
      '      TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight+ftTop;'
      '      MemoLine.Text:=IntToStr(LineFIO);'
      '      LineFIO:=LineFIO+1;'
      '      MemoLine.Frame.Typ :=ftLeft + ftRight+ftTop;'
      '    end;'
      '  FIO_LAST:=<frxDBDatasetDetails."FIO">;'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'LineFIO:=1;'
      'end;'
      ''
      'procedure Subreport1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '//  MasterData2.Height:=3;'
      '//  Memo9.Height:=60;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 432
    Top = 248
    Datasets = <
      item
        DataSet = frxDBDatasetDetails
        DataSetName = 'frxDBDatasetDetails'
      end
      item
        DataSet = frxDBDatasetMaster
        DataSetName = 'frxDBDatasetMaster'
      end>
    Variables = <
      item
        Name = 'BUILDS'
        Value = #39#1054#1073#1097#1077#1078#1080#1090#1080#1077#39
      end
      item
        Name = 'FAK'
        Value = #39#1060#1072#1082#1091#1083#1100#1090#1077#1090#39
      end
      item
        Name = 'KURS'
        Value = #39#1050#1091#1088#1089#39
      end
      item
        Name = 'CATPAY'
        Value = #39#1050#1072#1090#1077#1075#1086#1088#1103' '#1086#1087#1083#1072#1090#1099#39
      end
      item
        Name = 'TYPELIVE'
        Value = #39#1058#1080#1087' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'CLASSLIVE'
        Value = #39#1050#1083#1072#1089#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'NAMEREPORT'
        Value = #39#1056#1077#1077#1089#1090#1088' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093#39
      end
      item
        Name = 'DATEROJ'
        Value = #39#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103#39
      end
      item
        Name = 'BEGPROPI'
        Value = #39#1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1088#1086#1087#1080#1089#1082#1080#39
      end
      item
        Name = 'ENDPROPI'
        Value = #39#1044#1072#1090#1072' '#1082#1086#1085#1094#1072' '#1087#1088#1086#1087#1080#1089#1082#1080#39
      end
      item
        Name = 'ROOM'
        Value = #39#1050#1086#1084#1085#1072#1090#1072#39
      end
      item
        Name = 'FIO'
        Value = #39#1060'.'#1048'.'#1054'.'#39
      end
      item
        Name = 'NN'
        Value = #39#8470' '#1087'/'#1087#39
      end
      item
        Name = 'VNAMEREPORT'
        Value = #39#1056#1077#1077#1089#1090#1088' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093#39
      end
      item
        Name = 'VPAGE'
        Value = #39#1057#1090#1088#39
      end
      item
        Name = 'DATERUN'
        Value = #39'01.12.2005'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Height = 153.063080000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDatasetMaster
        DataSetName = 'frxDBDatasetMaster'
        RowCount = 0
        object MemoBuilds: TfrxMemoView
          Top = 95.590600000000000000
          Width = 247.200000000000000000
          Height = 18.897650000000000000
          Visible = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[BUILDS]:[frxDBDatasetMaster."BUILDS"]')
          ParentFont = False
        end
        object MemoName_Fak: TfrxMemoView
          Align = baLeft
          Top = 114.488250000000000000
          Width = 240.800000000000000000
          Height = 18.897650000000000000
          Visible = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[FAK]:[frxDBDatasetMaster."NAME_FAK"]')
          ParentFont = False
        end
        object MemoKurs: TfrxMemoView
          Align = baLeft
          Left = 240.800000000000000000
          Top = 114.488250000000000000
          Width = 221.600000000000000000
          Height = 18.897650000000000000
          Visible = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[KURS]:[frxDBDatasetMaster."KURS"]')
          ParentFont = False
        end
        object MemoCat_pay: TfrxMemoView
          Align = baLeft
          Left = 462.400000000000100000
          Top = 114.488250000000000000
          Width = 253.600000000000000000
          Height = 18.897650000000000000
          Visible = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[CATPAY]:[frxDBDatasetMaster."CAT_PAY"]')
          ParentFont = False
        end
        object MemoType_Live: TfrxMemoView
          Align = baLeft
          Top = 134.165430000000000000
          Width = 279.200000000000000000
          Height = 18.897650000000000000
          Visible = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[TYPELIVE]:[frxDBDatasetMaster."TYPE_LIVE"]')
          ParentFont = False
        end
        object MemoClass_live: TfrxMemoView
          Align = baLeft
          Left = 279.200000000000000000
          Top = 134.165430000000000000
          Width = 292.000000000000000000
          Height = 18.897650000000000000
          Visible = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[CLASSLIVE]:[frxDBDatasetMaster."CLASS_LIVE"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baCenter
          Left = 292.913575000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo17OnBeforePrint'
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[VNAMEREPORT]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Align = baCenter
          Left = 292.913575000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1088#1072#1089#1095#1077#1090' '#1089#1091#1084#1084#1099' '#1082' '#1086#1087#1083#1072#1090#1077' '#1085#1072' [DATERUN] '#1075'.)')
          ParentFont = False
        end
        object MemoSCH: TfrxMemoView
          Top = 56.692949999999990000
          Width = 644.050650000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1044#1090' - [frxDBDatasetMaster."SCH_NUMBER_DB"] '#1050#1090' - [frxDBDatasetMast' +
              'er."SCH_NUMBER_KD"]')
          ParentFont = False
        end
        object MemoSMETA: TfrxMemoView
          Top = 75.590600000000000000
          Width = 644.050650000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1048#1089#1090'. '#1092#1080#1085'. [frxDBDatasetMaster."SMETA_KOD"].[frxDBDatasetMaster."' +
              'RAZD_KOD"].[frxDBDatasetMaster."ST_KOD"].[frxDBDatasetMaster."KE' +
              'KV_KOD"] [frxDBDatasetDetails."SMETA_TITLE"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 30.236240000000000000
        Top = 196.535560000000000000
        Width = 680.315400000000000000
        DataSet = frxDBDatasetDetails
        DataSetName = 'frxDBDatasetDetails'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Align = baLeft
          Left = 37.795300000000000000
          Width = 200.315090000000000000
          Height = 30.236240000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          SuppressRepeated = True
        end
        object MemoLINE: TfrxMemoView
          Align = baLeft
          Width = 37.795300000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baLeft
          Left = 238.110390000000000000
          Width = 109.606370000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '[frxDBDatasetDetails."DOC_TYPE"] '#8470'[frxDBDatasetDetails."DOC_NUM"' +
              ']'
            '  '#1086#1090' [frxDBDatasetDetails."DOC_DATE"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 347.716760000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."SUMMA"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 347.716760000000000000
          Top = 11.338590000000010000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            
              '[frxDBDatasetDetails."SMETA_KOD"].[frxDBDatasetDetails."RAZD_KOD' +
              '"].[frxDBDatasetDetails."ST_KOD"].[frxDBDatasetDetails."KEKV_KOD' +
              '"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 457.323130000000000000
          Width = 222.992270000000000000
          Height = 30.236240000000000000
          DataField = 'DOC_NOTE'
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetDetails."DOC_NOTE"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 249.448980000000000000
        Width = 680.315400000000000000
        object Memo6: TfrxMemoView
          Left = 238.110390000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."SUMMA">,DetailData1)] '#1075#1088#1085'.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1091#1084#1084#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1081)
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 18.897650000000000000
        Top = 328.819110000000000000
        Width = 680.315400000000000000
        object Memo7: TfrxMemoView
          Left = 238.110390000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."SUMMA">,DetailData1)] '#1075#1088#1085'.')
          ParentFont = False
        end
      end
    end
  end
  object TimerReports: TTimer
    Enabled = False
    Left = 464
    Top = 248
  end
  object RxMemoryData: TRxMemoryData
    Active = True
    FieldDefs = <>
    Left = 504
    Top = 184
  end
  object frxDBDatasetMasterRX: TfrxDBDataset
    UserName = 'frxDBDatasetMasterRX'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintMasterRX
    Left = 536
    Top = 184
  end
  object pFIBDataSetPrintMasterRX: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 568
    Top = 184
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetSchDB: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct st_dt_report_pay_doc_prov.sch_number_db,'
      'st_dt_report_pay_doc_prov.sch_title_db'
      'from st_dt_report_pay_doc_prov'
      'where st_dt_report_pay_doc_prov.id_session=:id_session')
    Left = 120
    Top = 32
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetSchCR: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct st_dt_report_pay_doc_prov.sch_number_kd,'
      'st_dt_report_pay_doc_prov.sch_title_kd'
      'from st_dt_report_pay_doc_prov'
      'where st_dt_report_pay_doc_prov.id_session=:id_session')
    Left = 328
    Top = 48
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetSM: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct st_dt_report_pay_doc_prov.smeta_kod,'
      'st_dt_report_pay_doc_prov.razd_kod,'
      'st_dt_report_pay_doc_prov.st_kod,'
      'st_dt_report_pay_doc_prov.kekv_kod,'
      'st_dt_report_pay_doc_prov.smeta_title'
      'from st_dt_report_pay_doc_prov'
      'where st_dt_report_pay_doc_prov.id_session=:id_session')
    Left = 120
    Top = 200
    poSQLINT64ToBCD = True
  end
  object StyleRepository: TcxStyleRepository
    Left = 208
    Top = 304
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor]
      Color = 15204351
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor]
      Color = 4194368
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle13
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.GroupByBox = cxStyle11
      Styles.Header = cxStyle12
      Styles.Indicator = cxStyle15
      Styles.Preview = cxStyle16
      BuiltIn = True
    end
  end
  object RxMemoryDataDB: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxSelectField'
        DataType = ftSmallint
      end
      item
        Name = 'RxNameField'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'RxNameVariant'
        DataType = ftString
        Size = 1000
      end>
    Left = 148
    Top = 32
  end
  object DataSourceDB: TDataSource
    DataSet = RxMemoryDataDB
    Left = 120
    Top = 60
  end
  object RxMemoryDataCR: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxSelectField'
        DataType = ftSmallint
      end
      item
        Name = 'RxNameField'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'RxNameVariant'
        DataType = ftString
        Size = 1000
      end>
    Left = 356
    Top = 48
  end
  object DataSourceCR: TDataSource
    DataSet = RxMemoryDataCR
    Left = 328
    Top = 76
  end
  object DataSourceSM: TDataSource
    DataSet = RxMemoryDataSM
    Left = 120
    Top = 228
  end
  object RxMemoryDataSM: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxSelectField'
        DataType = ftSmallint
      end
      item
        Name = 'RxNameField'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'RxNameVariant'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'RxMemoryDataKEKV'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataST'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataRAZD'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataSM'
        DataType = ftVariant
      end>
    Left = 148
    Top = 200
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
    Left = 240
    Top = 40
  end
  object frxXLSExport2: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 272
    Top = 40
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 304
    Top = 56
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
    Left = 272
    Top = 72
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 240
    Top = 72
  end
end
