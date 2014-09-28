object FormActions: TFormActions
  Left = 527
  Top = 83
  Width = 475
  Height = 500
  Caption = #1044#1110#1111
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object ToolBarActions: TToolBar
    Left = 0
    Top = 0
    Width = 467
    Height = 40
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 62
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Images = DMMain.SmallImages
    ParentFont = False
    ShowCaptions = True
    TabOrder = 0
    Wrapable = False
    object ToolButtonAdd: TToolButton
      Left = 0
      Top = 0
      Action = Add
      ImageIndex = 1
    end
    object ToolButtonEdit: TToolButton
      Left = 62
      Top = 0
      Action = Edit
      ImageIndex = 5
    end
    object ToolButtonDel: TToolButton
      Left = 124
      Top = 0
      Action = Del
      ImageIndex = 2
    end
    object ToolButtonSel: TToolButton
      Left = 186
      Top = 0
      Action = Sel
      ImageIndex = 3
    end
    object ToolButtonPrint: TToolButton
      Left = 248
      Top = 0
      Caption = #1044#1088#1091#1082
      ImageIndex = 9
      OnClick = ToolButtonPrintClick
    end
    object ToolButtonExit: TToolButton
      Left = 310
      Top = 0
      Action = Exit
      ImageIndex = 6
    end
  end
  object StatusBarActions: TStatusBar
    Left = 0
    Top = 447
    Width = 467
    Height = 19
    Panels = <>
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 40
    Width = 467
    Height = 407
    Align = alClient
    TabOrder = 2
    object DBGridActions: TcxGridDBTableView
      OnDblClick = DBGridActionsDblClick
      DataController.DataSource = DataSourceActions
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.ContentOdd = cxStyle1
      object DBGridActionsDBColumn1: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 194
        DataBinding.FieldName = 'NAME'
      end
      object DBGridActionsDBColumn2: TcxGridDBColumn
        Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 289
        DataBinding.FieldName = 'FULL_NAME'
      end
      object DBGridActionsDBColumn3: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_ACTION'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = DBGridActions
    end
  end
  object ActionList: TActionList
    Left = 248
    Top = 120
    object Add: TAction
      Category = 'Action'
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = AddExecute
    end
    object Edit: TAction
      Category = 'Action'
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = EditExecute
    end
    object Del: TAction
      Category = 'Action'
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      OnExecute = DelExecute
    end
    object Sel: TAction
      Category = 'Action'
      Caption = #1042#1080#1073#1088#1072#1090#1080
      ShortCut = 13
      OnExecute = SelExecute
    end
    object Exit: TAction
      Category = 'Action'
      Caption = #1042#1080#1081#1090#1080
      OnExecute = ExitExecute
    end
    object Print: TAction
      Category = 'Action'
      Caption = 'Print'
      ShortCut = 16464
      SecondaryShortCuts.Strings = (
        'F6')
      OnExecute = PrintExecute
    end
  end
  object DataSourceActions: TDataSource
    DataSet = DSetActions
    Left = 216
    Top = 152
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 88
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 120
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clScrollBar
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSource = DataSourceActions
    Left = 184
    Top = 240
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40004.599953703700000000
    ReportOptions.LastChange = 40009.642100509300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 151
    Top = 240
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
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
      BottomMargin = 4.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 160.000000000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [frxDBDataset."NAME"]')
        end
        object Memo2: TfrxMemoView
          Left = 257.008040000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [frxDBDataset."FULL_NAME"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 22.677180000000000000
        ParentFont = False
        Top = 76.000000000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo6: TfrxMemoView
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo4: TfrxMemoView
          Width = 257.008040000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            ' [FIELD_1]')
        end
        object Memo5: TfrxMemoView
          Left = 257.008040000000000000
          Width = 461.102660000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            ' [FIELD_2]')
        end
        object Line1: TfrxLineView
          Left = 257.008040000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
      end
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 41.574830000000000000
        ParentFont = False
        Top = 16.000000000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 718.110700000000000000
          Height = 41.574830000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[REPORT_TITLE]')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 240.000000000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
    end
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 184
    Top = 272
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 184
    Top = 304
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 184
    Top = 336
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 184
    Top = 368
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 184
    Top = 400
  end
  object DSetActions: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    Left = 248
    Top = 152
    poSQLINT64ToBCD = True
  end
end
