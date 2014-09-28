object FormOptions: TFormOptions
  Left = 331
  Top = 301
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 219
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 477
    Height = 185
    Shape = bsFrame
  end
  object YesBtn: TcxButton
    Left = 288
    Top = 189
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
    Top = 189
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
    Top = 153
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
    Top = 151
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
    Left = 88
    Top = 119
    Width = 385
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
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38789.428188472200000000
    ReportOptions.LastChange = 38807.466242928200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'uses '#39'Reports\GoodPageBreak.pas'#39';'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  pfBeforePrint(Sender);'
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    pfBeforePrint(Sender);'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    pfBeforePrint(Sender);'
      'end;'
      ''
      'procedure GroupHeader1OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      '       pfCalcHeight(Sender);'
      'end;'
      ''
      'procedure MasterData1OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      '       pfCalcHeight(Sender);'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  MasterData1.Font.Size := <FONT_SIZE>;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 168
    Top = 8
    Datasets = <
      item
        DataSetName = 'ReportQuery'
      end>
    Variables = <
      item
        Name = 'REPORT_DATE'
        Value = #39'31.03.2006'#39
      end
      item
        Name = 'FONT_SIZE'
        Value = '10'
      end
      item
        Name = 'Upper_Name'
        Value = Null
      end
      item
        Name = 'U_NAME'
        Value = Null
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
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo1: TfrxMemoView
          Top = 3.779530000000001000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1047#1074#1110#1090' '#1087#1086' '#1085#1072#1076#1073#1072#1074#1082#1072#1084' '#1090#1072' '#1076#1086#1087#1083#1072#1090#1072#1084' '#1085#1072' [REPORT_DATE]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 389.291590000000000000
          Top = 3.779530000000001000
          Width = 317.480520000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[U_NAME]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        OnAfterCalcHeight = 'GroupHeader1OnAfterCalcHeight'
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'ReportQuery."DEPARTMENT_NAME"'
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportQuery."DEPARTMENT_NAME"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 362.834880000000000000
          Width = 355.275722360000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '([ReportQuery."PARENT_DEPARTMENT"])')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 18.897650000000000000
        Top = 90.708720000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          Width = 30.236220470000000000
          Height = 18.897650000000000000
          Color = 14737632
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
        end
        object Memo5: TfrxMemoView
          Left = 30.236240000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Color = 14737632
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1053)
        end
        object Memo6: TfrxMemoView
          Left = 64.252010000000000000
          Width = 117.165354330709000000
          Height = 18.897650000000000000
          Color = 14737632
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1055'/'#1073)
        end
        object Memo7: TfrxMemoView
          Left = 181.417440000000000000
          Width = 181.417322834646000000
          Height = 18.897650000000000000
          Color = 14737632
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
        end
        object Memo8: TfrxMemoView
          Left = 362.834880000000000000
          Width = 158.740157480000000000
          Height = 18.897650000000000000
          Color = 14737632
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1072#1073#1086' '#1076#1086#1087#1083#1072#1090#1080)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 521.575140000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          Color = 14737632
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1076#1073#1072#1074#1082#1072)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 574.488560000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          Color = 14737632
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1095#1072#1090#1086#1082)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 646.299630000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          Color = 14737632
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1085#1077#1094#1100)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        OnAfterCalcHeight = 'MasterData1OnAfterCalcHeight'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSetName = 'ReportQuery'
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 30.236240000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TN'
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportQuery."TN"]')
        end
        object Memo12: TfrxMemoView
          Left = 64.252010000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'FIO_SMALL'
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportQuery."FIO_SMALL"]')
        end
        object Memo13: TfrxMemoView
          Left = 181.417440000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_POST'
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportQuery."NAME_POST"]')
        end
        object Memo14: TfrxMemoView
          Left = 362.834880000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_BONUS'
          DataSetName = 'ReportQuery'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportQuery."NAME_BONUS"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 521.575140000000000000
          Width = 52.913395590000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'THE_BONUS'
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportQuery."THE_BONUS"]')
        end
        object Memo16: TfrxMemoView
          Left = 574.488560000000000000
          Width = 71.811045590000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DATE_BEG'
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportQuery."DATE_BEG"]')
        end
        object Memo17: TfrxMemoView
          Left = 646.299630000000000000
          Width = 71.811045590000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'REAL_DATE_END'
          DataSetName = 'ReportQuery'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportQuery."REAL_DATE_END"]')
        end
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
end
