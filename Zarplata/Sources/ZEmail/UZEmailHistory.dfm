object frmZEmailHistory: TfrmZEmailHistory
  Left = 311
  Top = 176
  Width = 1021
  Height = 518
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1088#1086#1079#1089#1080#1083#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 480
    Align = alLeft
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 1
      Top = 63
      Width = 607
      Height = 116
      Align = alClient
      TabOrder = 0
      object cxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = MailsDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'TN'
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGridDBTableView1DBColumn7: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 72
          DataBinding.FieldName = 'id_log'
        end
        object cxGridDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1086#1079#1089#1080#1083#1082#1080
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          SortOrder = soDescending
          Width = 79
          DataBinding.FieldName = 'datetime'
        end
        object cxGridDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1042#1080#1076' '#1088#1086#1079#1089#1080#1083#1082#1080
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 71
          DataBinding.FieldName = 'MESSAGE_TYPE_STR'
        end
        object cxGridDBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1086#1084#1087#39#1102#1090#1077#1088#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 93
          DataBinding.FieldName = 'COMPUTER_NAME'
        end
        object cxGridDBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 80
          DataBinding.FieldName = 'USER_NAME'
        end
        object cxGridDBTableView1DBColumn5: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 46
          DataBinding.FieldName = 'IP'
        end
        object cxGridDBTableView1DBColumn6: TcxGridDBColumn
          Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1079#1089#1080#1083#1082#1080
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 60
          DataBinding.FieldName = 'z_period_str'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 179
      Width = 607
      Height = 300
      Align = alBottom
      TabOrder = 1
      object cxDBMemo1: TcxDBMemo
        Left = 1
        Top = 42
        Width = 605
        Height = 257
        Align = alClient
        DataBinding.DataField = 'Log_value'
        DataBinding.DataSource = MailsDataSource
        Style.Color = 16247513
        TabOrder = 0
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 605
        Height = 41
        Align = alTop
        Caption = #1047#1084#1110#1089#1090' '#1092#1072#1081#1083#1091' '#1087#1088#1086#1090#1086#1082#1086#1083#1091
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 607
      Height = 62
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 182
        Top = 12
        Width = 136
        Height = 13
        Caption = #1055#1088#1086#1090#1086#1082#1086#1083#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 454
        Top = 13
        Width = 15
        Height = 13
        Caption = #1087#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxButton1: TcxButton
        Left = 10
        Top = 8
        Width = 75
        Height = 25
        Caption = #1044#1088#1091#1082
        TabOrder = 0
        OnClick = cxButton1Click
      end
      object cxDateEdit1: TcxDateEdit
        Left = 324
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 1
        OnExit = cxDateEdit1Exit
      end
      object cxDateEdit2: TcxDateEdit
        Left = 475
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 2
        OnExit = cxDateEdit2Exit
      end
      object cxButton2: TcxButton
        Left = 90
        Top = 8
        Width = 75
        Height = 25
        Caption = #1054#1085#1086#1074#1080#1090#1080
        TabOrder = 3
        OnClick = cxButton2Click
      end
      object cxButtonEdit1: TcxButtonEdit
        Left = 323
        Top = 33
        Width = 273
        Height = 21
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
        TabOrder = 4
        OnExit = cxButtonEdit1Exit
      end
      object cxCheckBox1: TcxCheckBox
        Left = 216
        Top = 32
        Width = 105
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1079#1072' '#1072#1076#1088#1077#1089#1072#1090#1086#1084
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 5
        OnClick = cxCheckBox1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 617
    Top = 0
    Width = 388
    Height = 480
    Align = alClient
    TabOrder = 1
    object cxGrid2: TcxGrid
      Left = 1
      Top = 1
      Width = 386
      Height = 478
      Align = alClient
      TabOrder = 0
      object cxGridDBTableView2: TcxGridDBTableView
        DataController.DataSource = MailItemsDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'TN'
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = cxGridDBColumn1
        OptionsCustomize.ColumnFiltering = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGridDBTableView2DBColumn2: TcxGridDBColumn
          Caption = #1058#1053
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'TN'
        end
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1055'.'#1030'.'#1041'. '#1072#1076#1088#1077#1089#1072#1090#1091
          PropertiesClassName = 'TcxHyperLinkEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          SortOrder = soAscending
          Width = 156
          DataBinding.FieldName = 'fio'
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1040#1076#1088#1077#1089#1072' '#1076#1086#1089#1090#1072#1074#1082#1080
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 131
          DataBinding.FieldName = 'contact_value'
        end
        object cxGridDBTableView2DBColumn1: TcxGridDBColumn
          Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'send_result_str'
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView2
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 609
    Top = 0
    Width = 8
    Height = 480
    HotZoneClassName = 'TcxMediaPlayer8Style'
    Control = Panel1
  end
  object Styles: TcxStyleRepository
    Left = 16
    Top = 352
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10382168
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13249860
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object WorkDatabase: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 80
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 80
  end
  object MailsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 80
    Top = 80
    poSQLINT64ToBCD = True
  end
  object MailItemsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = MailsDataSource
    Left = 112
    Top = 80
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object MailsDataSource: TDataSource
    DataSet = MailsDataSet
    Left = 80
    Top = 112
  end
  object MailItemsDataSource: TDataSource
    DataSet = MailItemsDataSet
    Left = 112
    Top = 112
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38810.595813368100000000
    ReportOptions.LastChange = 40427.402200034730000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 80
    Top = 144
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
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
      object ReportTitle1: TfrxReportTitle
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1086#1090#1086#1082#1086#1083' '#8470' [PR_NUMBER] '#1074#1110#1076' [PR_DATE] [PR_TYPE]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[DATE] [TIME]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 45.354360000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1042#1080#1082#1086#1085#1072#1074': [USER_NAME], IP:[IP], Computer:[COMPUTER_NAME])')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 34.015770000000100000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Memo2: TfrxMemoView
          Left = 41.574830000000000000
          Width = 313.700990000000000000
          Height = 34.015770000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'. '#1072#1076#1088#1077#1089#1072#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 355.275820000000000000
          Width = 283.464750000000000000
          Height = 34.015770000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1040#1076#1088#1077#1089#1072' '#1088#1086#1079#1089#1080#1083#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000100000
          Height = 34.015770000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074#1110#1076#1087#1088#1072#1074#1083#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 41.574830000000000000
          Height = 34.015770000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000100000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          Left = 41.574830000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."FIO"]([frxDBDataset1."TN"])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 355.275820000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."contact_value"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000100000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."send_result_str"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo3: TfrxSysMemoView
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[LINE#].')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 532.913730000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[PAGE#] '#1079' [TOTALPAGES#]')
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = MailItemsDataSet
    Left = 112
    Top = 144
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
    Left = 25
    Top = 243
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 57
    Top = 243
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 97
    Top = 243
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 137
    Top = 243
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 177
    Top = 235
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    Left = 217
    Top = 235
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 281
    Top = 243
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 225
    Top = 267
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
    Left = 257
    Top = 275
  end
end
