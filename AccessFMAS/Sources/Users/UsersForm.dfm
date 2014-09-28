object FormUsers: TFormUsers
  Left = 371
  Top = 229
  Width = 693
  Height = 479
  Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBarUsers: TToolBar
    Left = 0
    Top = 0
    Width = 677
    Height = 40
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 61
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
      Left = 61
      Top = 0
      Action = Edit
      ImageIndex = 5
    end
    object ToolButtonDel: TToolButton
      Left = 122
      Top = 0
      Action = Del
      ImageIndex = 2
    end
    object ToolButtonSel: TToolButton
      Left = 183
      Top = 0
      Action = Sel
      ImageIndex = 3
    end
    object PrintUsers: TToolButton
      Left = 244
      Top = 0
      Caption = #1044#1088#1091#1082
      ImageIndex = 9
      OnClick = PrintUsersClick
    end
    object ToolButtonExit: TToolButton
      Left = 305
      Top = 0
      Action = Exit
      ImageIndex = 6
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 40
    Width = 677
    Height = 232
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      OnKeyDown = cxGrid1DBTableView1KeyDown
      OnKeyPress = cxGrid1DBTableView1KeyPress
      DataController.DataSource = DataSourceUsers
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_USER'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.ContentOdd = cxStyle1
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1030#1084'`'#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soAscending
        Width = 190
        DataBinding.FieldName = 'NAME'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1055'.'#1030'.'#1041'. '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 285
        DataBinding.FieldName = 'FULL_NAME'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object SearchPanel: TPanel
    Left = 0
    Top = 272
    Width = 677
    Height = 169
    Align = alBottom
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 132
      Width = 44
      Height = 13
      Caption = #1064#1091#1082#1072#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 56
      Height = 13
      Caption = #1055#1088#1080#1084#1110#1090#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SearchEdit: TEdit
      Left = 72
      Top = 128
      Width = 153
      Height = 21
      TabOrder = 0
      OnChange = SearchEditChange
    end
    object RadioButton1: TRadioButton
      Left = 240
      Top = 126
      Width = 169
      Height = 17
      Caption = #1047#1072' '#1110#1084#1077#1085#1077#1084' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 240
      Top = 144
      Width = 168
      Height = 17
      Caption = #1047#1072' '#1055'.'#1030'.'#1041'. '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object SearchNextButton: TButton
      Left = 424
      Top = 126
      Width = 137
      Height = 25
      Caption = #1064#1091#1082#1072#1090#1080' '#1076#1072#1083#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = SearchNextButtonClick
    end
    object DBMemo1: TDBMemo
      Left = 96
      Top = 12
      Width = 569
      Height = 89
      DataField = 'NOTE'
      DataSource = DataSourceUsers
      TabOrder = 4
    end
  end
  object ActionList: TActionList
    Left = 248
    Top = 120
    object Add: TAction
      Category = 'User'
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = AddExecute
    end
    object Edit: TAction
      Category = 'User'
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = EditExecute
    end
    object Del: TAction
      Category = 'User'
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      OnExecute = DelExecute
    end
    object Sel: TAction
      Category = 'User'
      Caption = #1042#1080#1073#1088#1072#1090#1080
      OnExecute = SelExecute
    end
    object Exit: TAction
      Category = 'User'
      Caption = #1042#1080#1081#1090#1080
      OnExecute = ExitExecute
    end
    object Print: TAction
      Category = 'User'
      Caption = 'Print'
      ShortCut = 16464
      SecondaryShortCuts.Strings = (
        'F6')
      OnExecute = PrintExecute
    end
  end
  object DataSourceUsers: TDataSource
    DataSet = DSetUsers
    Left = 216
    Top = 152
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 64
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle2
      Styles.Content = cxStyle3
      Styles.ContentEven = cxStyle4
      Styles.ContentOdd = cxStyle5
      Styles.Inactive = cxStyle11
      Styles.IncSearch = cxStyle12
      Styles.Selection = cxStyle15
      Styles.FilterBox = cxStyle6
      Styles.Footer = cxStyle7
      Styles.Group = cxStyle8
      Styles.GroupByBox = cxStyle9
      Styles.Header = cxStyle10
      Styles.Indicator = cxStyle13
      Styles.Preview = cxStyle14
      BuiltIn = True
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 8
    Top = 104
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSource = DataSourceUsers
    Left = 336
    Top = 240
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40004.599953703700000000
    ReportOptions.LastChange = 40007.538789062500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 368
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
      LeftMargin = 11.000000000000000000
      RightMargin = 11.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 4.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 166.299320000000000000
        Width = 710.551640000000000000
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
            ' [frxDBDataset1."NAME"]')
        end
        object Memo2: TfrxMemoView
          Left = 257.008040000000000000
          Width = 453.543600000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [frxDBDataset1."FULL_NAME"]')
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
        Top = 83.149660000000000000
        Width = 710.551640000000000000
        Stretched = True
        object Memo4: TfrxMemoView
          Width = 257.008040000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [FIELD_1]')
        end
        object Memo5: TfrxMemoView
          Left = 257.008040000000000000
          Width = 453.543600000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [FIELD_2]')
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
        Top = 18.897650000000000000
        Width = 710.551640000000000000
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 710.551640000000000000
          Height = 41.574830000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[REPORT_TITLE]')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 245.669450000000000000
        Width = 710.551640000000000000
        object Memo9: TfrxMemoView
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page]')
        end
      end
    end
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
    Left = 336
    Top = 304
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 336
    Top = 336
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 336
    Top = 272
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 336
    Top = 368
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 336
    Top = 400
  end
  object PopupMenu1: TPopupMenu
    Left = 16
    Top = 144
    object N1: TMenuItem
      Caption = #1055#1077#1088#1074#1080#1085#1085#1072' '#1110#1085#1110#1094#1110#1072#1083#1110#1079#1072#1094#1110#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072' '#1074' '#1089#1080#1089#1090#1077#1084#1110' "'#1047#1072#1088#1087#1083#1072#1090#1072'"'
      OnClick = N1Click
    end
  end
  object DSetUsers: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    Left = 248
    Top = 152
    poSQLINT64ToBCD = True
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Left = 80
    Top = 112
  end
end
