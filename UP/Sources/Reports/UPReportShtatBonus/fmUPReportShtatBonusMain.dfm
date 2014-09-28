object FormOptions: TFormOptions
  Left = 528
  Top = 352
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 265
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 477
    Height = 209
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 8
    Top = 248
    Width = 11
    Height = 13
    Caption = 'tst'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object YesBtn: TcxButton
    Left = 288
    Top = 213
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 384
    Top = 213
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    LookAndFeel.Kind = lfFlat
  end
  object EditDepartment: TcxButtonEdit
    Left = 8
    Top = 75
    Width = 465
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditDepartmentPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object LabelDepartment: TcxLabel
    Left = 8
    Top = 55
    Width = 465
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object LabelDateForm: TcxLabel
    Left = 8
    Top = 185
    Width = 336
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object DateEdit: TcxDateEdit
    Left = 352
    Top = 183
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DateButtons = [btnToday]
    Properties.OnChange = DateEditPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
  object KodSmEdit: TcxButtonEdit
    Left = 8
    Top = 119
    Width = 462
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = KodSmEditPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object SR: TcxButtonEdit
    Left = 8
    Top = 27
    Width = 465
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = SRPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
  end
  object LabelShtatDoc: TcxLabel
    Left = 8
    Top = 7
    Width = 465
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 5
    Top = 103
    Width = 465
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
    Caption = #1050#1086#1096#1090#1086#1088#1080#1089
  end
  object cxLabel2: TcxLabel
    Left = 5
    Top = 143
    Width = 465
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
    Caption = #1056#1110#1074#1077#1085#1100' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1110' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1111
  end
  object cxButtonEditLevel: TcxButtonEdit
    Left = 8
    Top = 159
    Width = 462
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditLevelPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
  end
  object ActionList: TActionList
    Left = 8
    Top = 136
    object YesAction: TAction
      Caption = 'YesAction'
      ShortCut = 16464
      OnExecute = YesActionExecute
    end
    object CancelAction: TAction
      Caption = 'CancelAction'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
    object DesRep: TAction
      Caption = 'DesRep'
      OnExecute = DesRepExecute
    end
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DSource: TDataSource
    DataSet = DSetTypePost
    Left = 112
    Top = 136
  end
  object DSetTypePost: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 72
    Top = 136
    poSQLINT64ToBCD = True
  end
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
    Top = 43
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 200
    Top = 7
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 104
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 168
    Top = 76
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 40
    Top = 75
    poSQLINT64ToBCD = True
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 168
    Top = 44
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 256
    Top = 8
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
    Top = 40
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 256
    Top = 72
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
    ReportOptions.LastChange = 38786.011454710600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Child1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <ReportDsetData."CNT_ALL">=0 then Child1.Visible:=False'
      '  else Child1.Visible:=True;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 168
    Top = 8
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
        Name = 'PDateForm'
        Value = #39'20.12.2005'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 143.622140000000000000
        Width = 1046.929810000000000000
        PrintOnFirstPage = False
        object Memo10: TfrxMemoView
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[date]')
        end
        object Memo13: TfrxMemoView
          Left = 835.276130000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [<Page>] '#1079' [<TotalPages>]')
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 102.047310000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo11: TfrxMemoView
          Left = 904.000000000000000000
          Top = 40.000000000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [date]')
        end
        object Memo12: TfrxMemoView
          Left = 831.496600000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [<Page>] '#1079' [<TotalPages>]')
        end
        object Memo14: TfrxMemoView
          Left = 952.441560000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'4')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 37.795300000000000000
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1085#1085#1110)
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Top = 60.472480000000000000
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086' '#1087#1088#1086#1092#1077#1089#1086#1088#1089#1100#1082#1086'-'#1074#1080#1082#1083#1072#1076#1072#1094#1100#1082#1080#1081' '#1089#1082#1083#1072#1076)
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Top = 79.370130000000000000
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1085#1072' [PDateForm] ('#1096#1090#1072#1090#1085#1110')')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        Child = Report.Child1
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepChild = True
        RowCount = 0
        object Memo1: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Color = 14145495
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."POST_TEXT"]')
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 351.496290000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'Child1OnBeforePrint'
        object Memo2: TfrxMemoView
          Width = 49.133863150000010000
          Height = 15.118120000000000000
          DataField = 'CNT_ALL'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL"]')
        end
        object Memo16: TfrxMemoView
          Left = 49.133890000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_EDU_UNIVER'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_EDU_UNIVER"]')
        end
        object Memo17: TfrxMemoView
          Left = 94.488250000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'PROC_EDU_UNIVER'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_EDU_UNIVER"]')
        end
        object Memo21: TfrxMemoView
          Left = 136.063080000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_AGE_LESS_40'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_LESS_40"]')
        end
        object Memo22: TfrxMemoView
          Left = 181.417440000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'PROC_AGE_LESS_40'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_LESS_40"]')
        end
        object Memo23: TfrxMemoView
          Left = 222.992270000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_AGE_BETW_40_AND_49'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_BETW_40_AND_49"]')
        end
        object Memo24: TfrxMemoView
          Left = 268.346630000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'PROC_AGE_BETW_40_AND_49'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_BETW_40_AND_49"]')
        end
        object Memo26: TfrxMemoView
          Left = 309.921460000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_AGE_BETW_50_AND_59'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_BETW_50_AND_59"]')
        end
        object Memo27: TfrxMemoView
          Left = 351.496290000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_BETW_50_AND_59"]')
        end
        object Memo28: TfrxMemoView
          Left = 389.291590000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_AGE_BETW_60_AND_65'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_BETW_60_AND_65"]')
        end
        object Memo29: TfrxMemoView
          Left = 434.645950000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'PROC_AGE_BETW_60_AND_65'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_BETW_60_AND_65"]')
        end
        object Memo30: TfrxMemoView
          Left = 476.220780000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_AGE_MORE_65'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_MORE_65"]')
        end
        object Memo31: TfrxMemoView
          Left = 521.575140000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'PROC_AGE_MORE_65'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_MORE_65"]')
        end
        object Memo4: TfrxMemoView
          Left = 563.149970000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_RUS_NATION'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_RUS_NATION"]')
        end
        object Memo5: TfrxMemoView
          Left = 608.504330000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_UKR_NATION'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_UKR_NATION"]')
        end
        object Memo6: TfrxMemoView
          Left = 653.858690000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_OTHER_NATION'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_OTHER_NATION"]')
        end
        object Memo32: TfrxMemoView
          Left = 744.567410000000000000
          Width = 41.574805590000000000
          Height = 15.118120000000000000
          DataField = 'PROC_STAJ_LESS_3'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_STAJ_LESS_3"]')
        end
        object Memo33: TfrxMemoView
          Left = 699.213050000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_STAJ_LESS_3'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_STAJ_LESS_3"]')
        end
        object Memo3: TfrxMemoView
          Left = 786.142240000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_STAJ_BETW_3_AND_9'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_STAJ_BETW_3_AND_9"]')
        end
        object Memo35: TfrxMemoView
          Left = 831.496600000000000000
          Width = 41.574805590000000000
          Height = 15.118120000000000000
          DataField = 'PROC_STAJ_BETW_3_AND_9'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_STAJ_BETW_3_AND_9"]')
        end
        object Memo36: TfrxMemoView
          Left = 873.071430000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_STAJ_BETW_10_AND_19'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_STAJ_BETW_10_AND_19"]')
        end
        object Memo37: TfrxMemoView
          Left = 918.425790000000000000
          Width = 41.574805590000000000
          Height = 15.118120000000000000
          DataField = 'PROC_STAJ_BETW_10_AND_19'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_STAJ_BETW_10_AND_19"]')
        end
        object Memo38: TfrxMemoView
          Left = 960.000620000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_STAJ_MORE_20'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_STAJ_MORE_20"]')
        end
        object Memo39: TfrxMemoView
          Left = 1005.354980000000000000
          Width = 41.574805590000000000
          Height = 15.118120000000000000
          DataField = 'PROC_STAJ_MORE_20'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_STAJ_MORE_20"]')
        end
      end
      object Header1: TfrxHeader
        Height = 60.472480000000000000
        Top = 226.771800000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo34: TfrxMemoView
          Width = 49.133863150000000000
          Height = 60.472480000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1074#1080#1082#1083'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 49.133890000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 94.488250000000000000
          Top = 37.795300000000030000
          Width = 41.574803150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 136.063080000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 181.417440000000000000
          Top = 37.795300000000030000
          Width = 41.574803150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 222.992270000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 268.346630000000000000
          Top = 37.795300000000030000
          Width = 41.574803150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 309.921460000000000000
          Top = 37.795300000000030000
          Width = 41.574803150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 351.496290000000000000
          Top = 37.795300000000030000
          Width = 37.795273150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 389.291590000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 434.645950000000000000
          Top = 37.795300000000030000
          Width = 41.574803150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 476.220780000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 521.575140000000000000
          Top = 37.795300000000030000
          Width = 41.574803150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 49.133890000000000000
          Width = 86.929190000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1102#1090#1100' '#1091#1085#1110#1074'. '#1086#1089#1074#1110#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 563.149970000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 608.504330000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 653.858690000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 563.149970000000000000
          Width = 45.354333150000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1091#1089'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 608.504330000000000000
          Width = 45.354333150000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1082#1088'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 653.858690000000000000
          Width = 45.354333150000000000
          Height = 37.795300000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1096'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 699.213050000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 744.567410000000000000
          Top = 37.795300000000030000
          Width = 41.574803150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 786.142240000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 831.496600000000000000
          Top = 37.795300000000030000
          Width = 41.574803150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 873.071430000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 918.425790000000000000
          Top = 37.795300000000030000
          Width = 41.574803150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 960.000620000000000000
          Top = 37.795300000000030000
          Width = 45.354333150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 1005.354980000000000000
          Top = 37.795300000000030000
          Width = 41.574803150000000000
          Height = 22.677180000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 136.063080000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' '#1074#1110#1082#1086#1084)
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 136.063080000000000000
          Top = 18.897650000000000000
          Width = 86.929163150000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086' 40')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 222.992270000000000000
          Top = 18.897650000000000000
          Width = 86.929163150000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '40 - 49')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 309.921460000000000000
          Top = 18.897650000000000000
          Width = 79.370103150000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '50 - 59')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 389.291590000000000000
          Top = 18.897650000000000000
          Width = 86.929163150000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '60 - 65')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 476.220780000000000000
          Top = 18.897650000000000000
          Width = 86.929163150000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1085#1072#1076' 65')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 699.213050000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' '#1089#1090#1072#1078#1077#1084' '#1088#1086#1073#1086#1090#1080)
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 699.213050000000000000
          Top = 18.897650000000000000
          Width = 86.929163150000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 3 '#1088'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 786.142240000000000000
          Top = 18.897650000000000000
          Width = 86.929163150000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3 - 9 '#1088'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 873.071430000000000000
          Top = 18.897650000000000000
          Width = 86.929163150000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '10 - 19 '#1088'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 960.000620000000000000
          Top = 18.897650000000000000
          Width = 86.929163150000000000
          Height = 18.897650000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1086#1085#1072#1076' 20 '#1088'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Memo25: TfrxMemoView
        Top = 14.897650000000000000
        Width = 952.441560000000000000
        Height = 18.897650000000000000
        DataField = 'FIRM_NAME'
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
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
  object DSetSr1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 256
    Top = 152
    poSQLINT64ToBCD = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 336
    Top = 48
  end
  object DSetSr2: TpFIBQuery
    Database = DB
    SQL.Strings = (
      'DELETE FROM SHTAT_MFUND_TABLE where Id_Session=:Id_Sess')
    Transaction = ReadTransaction
    Left = 336
  end
  object pFIBDataSetPrintMaster: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 370
    Top = 80
    poSQLINT64ToBCD = True
  end
  object DataSourceMaster: TDataSource
    DataSet = pFIBDataSetPrintMaster
    Left = 338
    Top = 80
  end
  object frxDBDatasetMaster: TfrxDBDataset
    UserName = 'frxDBDatasetMaster'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintMaster
    Left = 402
    Top = 80
  end
  object frxDBDatasetDetails: TfrxDBDataset
    UserName = 'frxDBDatasetDetails'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintDetail
    Left = 402
    Top = 112
  end
  object pFIBDataSetPrintDetail: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    DataSource = DataSourceMaster
    Left = 370
    Top = 112
    poSQLINT64ToBCD = True
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 72
    Top = 104
  end
  object pFIBDataSetCreateFilter: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      
        '  from UP_DT_REPORT_FILTER_CREATE(:IN_ID_REPORT_SESSION,:IN_ID_S' +
        'P_REPORT)'
      'where UP_DT_REPORT_FILTER_CREATE.out_id_sp_filter=1')
    Left = 160
    Top = 184
    poSQLINT64ToBCD = True
  end
end
