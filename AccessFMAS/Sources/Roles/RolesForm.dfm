object FormRoles: TFormRoles
  Left = 639
  Top = 191
  Width = 493
  Height = 530
  Caption = #1043#1088#1091#1087#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object ToolBarRoles: TToolBar
    Left = 0
    Top = 0
    Width = 485
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
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 1
    end
    object ToolButtonEdit: TToolButton
      Left = 62
      Top = 0
      Action = Edit
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 5
    end
    object ToolButtonDel: TToolButton
      Left = 124
      Top = 0
      Action = Del
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      ImageIndex = 2
    end
    object ToolButtonSel: TToolButton
      Left = 186
      Top = 0
      Action = Sel
      Caption = #1042#1080#1073#1088#1072#1090#1080
      ImageIndex = 3
    end
    object GroupPrint: TToolButton
      Left = 248
      Top = 0
      Caption = #1044#1088#1091#1082
      ImageIndex = 9
      OnClick = GroupPrintClick
    end
    object ToolButtonExit: TToolButton
      Left = 310
      Top = 0
      Action = Exit
      Caption = #1042#1080#1081#1090#1080
      ImageIndex = 6
    end
  end
  object StatusBarRoles: TStatusBar
    Left = 0
    Top = 477
    Width = 485
    Height = 19
    Panels = <>
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 40
    Width = 485
    Height = 437
    Align = alClient
    TabOrder = 2
    object DBGridRoles: TcxGridDBTableView
      OnDblClick = DBGridRolesDblClick
      DataController.DataSource = DataSourceRoles
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
      object DBGridRolesDBColumn1: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soAscending
        Width = 194
        DataBinding.FieldName = 'NAME'
      end
      object DBGridRolesDBColumn2: TcxGridDBColumn
        Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 289
        DataBinding.FieldName = 'FULL_NAME'
      end
      object DBGridRolesDBColumn3: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_ROLE'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = DBGridRoles
    end
  end
  object ActionList: TActionList
    Left = 248
    Top = 120
    object Add: TAction
      Category = 'Role'
      Caption = ' '#1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = AddExecute
    end
    object Edit: TAction
      Category = 'Role'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = EditExecute
    end
    object Del: TAction
      Category = 'Role'
      Caption = ' '#1059#1076#1072#1083#1080#1090#1100
      OnExecute = DelExecute
    end
    object Sel: TAction
      Category = 'Role'
      Caption = ' '#1042#1099#1073#1088#1072#1090#1100
      OnExecute = SelExecute
    end
    object Exit: TAction
      Category = 'Role'
      Caption = ' '#1042#1099#1093#1086#1076' '
      OnExecute = ExitExecute
    end
    object Print: TAction
      Category = 'Role'
      Caption = 'Print'
      ShortCut = 16464
      SecondaryShortCuts.Strings = (
        'F6')
      OnExecute = PrintExecute
    end
  end
  object DataSourceRoles: TDataSource
    DataSet = DSetRoles
    Left = 216
    Top = 152
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 96
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 128
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clScrollBar
    end
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40004.599953703700000000
    ReportOptions.LastChange = 40007.380864074080000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 184
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
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
        RowCount = 0
        Stretched = True
        object Memo3: TfrxMemoView
          Width = 718.110253310000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Color = cl3DLight
          Highlight.Condition = '<Line> mod 2 = 1'
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NAME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftRight]
          Memo.Strings = (
            '[DataSourceRoles."NAME"]')
        end
        object Memo2: TfrxMemoView
          Left = 260.787570000000000000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'FULL_NAME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Memo.Strings = (
            '[DataSourceRoles."FULL_NAME"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 26.456710000000000000
        ParentFont = False
        Top = 71.811070000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo6: TfrxMemoView
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000008000
          Width = 253.228510000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[FIELD_1]')
        end
        object Memo5: TfrxMemoView
          Left = 260.787570000000000000
          Top = 3.779530000000008000
          Width = 457.323130000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[FIELD_2]')
        end
        object Line1: TfrxLineView
          Left = 257.008040000000000000
          Height = 26.456710000000000000
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
        Height = 30.236240000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo7: TfrxMemoView
          Left = 18.897650000000000000
          Width = 680.315400000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[REPORT_TITLE]')
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSource = DataSourceRoles
    Left = 216
    Top = 240
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 216
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
    Left = 216
    Top = 304
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 216
    Top = 336
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 216
    Top = 368
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 216
    Top = 400
  end
  object DSetRoles: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    Left = 248
    Top = 152
    poSQLINT64ToBCD = True
  end
end
