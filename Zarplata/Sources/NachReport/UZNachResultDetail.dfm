object frmNachDetailReport: TfrmNachDetailReport
  Left = 302
  Top = 401
  Width = 855
  Height = 445
  Caption = #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 366
    Width = 839
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      839
      41)
    object cxButton2: TcxButton
      Left = 760
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 0
      OnClick = cxButton2Click
    end
    object BPrint: TcxButton
      Left = 672
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1044#1088#1091#1082
      TabOrder = 1
      OnClick = BPrintClick
    end
  end
  object Panel2: TPanel
    Left = 352
    Top = 0
    Width = 487
    Height = 366
    Align = alRight
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 485
      Height = 364
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      object cxGridDBBandedTableView1: TcxGridDBBandedTableView
        DataController.DataSource = DataSourceVidOpl
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'fss'
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'fbl'
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'fzp'
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'fzp'
            Column = fzp1
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'fbl'
            Column = fbl1
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'fss'
            Column = fss1
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetDevExpress
        Bands = <
          item
            Caption = #1059' '#1088#1086#1079#1088#1110#1079#1110' '#1074#1080#1076#1110#1074' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
            Width = 215
          end>
        object cxGridDBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
          Caption = #1050#1086#1076
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'VIDOPL_CODE'
        end
        object cxGridDBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1080
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 134
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'VIDOPL_FULL'
        end
        object fzp1: TcxGridDBBandedColumn
          Caption = #1060#1047#1055
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 84
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'fzp'
        end
        object fss1: TcxGridDBBandedColumn
          Caption = #1060#1047#1057
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 58
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'fss'
        end
        object fbl1: TcxGridDBBandedColumn
          Caption = #1060#1051#1051
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 57
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'fbl'
        end
        object cxGridDBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
          Caption = #1041#1102#1076#1078#1077#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'smeta_kod'
        end
        object cxGridDBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
          Caption = #1055#1077#1088#1110#1086#1076
          Visible = False
          GroupIndex = 0
          Options.Filtering = False
          SortOrder = soAscending
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
          DataBinding.FieldName = 'Period'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBBandedTableView1
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 344
    Top = 0
    Width = 8
    Height = 366
    HotZoneClassName = 'TcxMediaPlayer8Style'
    AlignSplitter = salRight
    Control = Panel2
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 366
    Align = alClient
    TabOrder = 3
    object cxGrid3: TcxGrid
      Left = 1
      Top = 1
      Width = 342
      Height = 364
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      object OborView: TcxGridDBBandedTableView
        DataController.DataSource = ResultsDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'fss'
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'fbl'
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'fzp'
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'fzp'
            Column = fsp
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'fbl'
            Column = fbl
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'fss'
            Column = fss
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetDevExpress
        Bands = <
          item
            Caption = #1059' '#1088#1086#1079#1088#1110#1079#1110' '#1092#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073
            Width = 215
          end>
        object SmColumn: TcxGridDBBandedColumn
          Caption = #1055'.'#1030'.'#1041
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 220
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'FIO'
        end
        object fsp: TcxGridDBBandedColumn
          Caption = #1060#1047#1055
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'fzp'
        end
        object fss: TcxGridDBBandedColumn
          Caption = #1060#1057#1047
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'fss'
        end
        object fbl: TcxGridDBBandedColumn
          Caption = #1060#1051#1051
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'fbl'
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = OborView
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 104
    Top = 48
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object columnst: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16445924
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15850688
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16711164
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle17
      Styles.Content = cxStyle20
      Styles.ContentEven = cxStyle21
      Styles.ContentOdd = cxStyle22
      Styles.Inactive = cxStyle28
      Styles.IncSearch = cxStyle29
      Styles.Selection = cxStyle32
      Styles.FilterBox = cxStyle23
      Styles.Footer = cxStyle24
      Styles.Group = cxStyle25
      Styles.GroupByBox = cxStyle26
      Styles.Header = cxStyle27
      Styles.Indicator = cxStyle30
      Styles.Preview = cxStyle31
      Styles.BandBackground = cxStyle18
      Styles.BandHeader = cxStyle19
      BuiltIn = True
    end
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TACommit
    Left = 40
    Top = 48
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TACommit
    Left = 8
    Top = 48
  end
  object ResultsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      '')
    Left = 8
    Top = 80
    poSQLINT64ToBCD = True
  end
  object ResultsDataSource: TDataSource
    DataSet = ResultsDataSet
    Left = 40
    Top = 80
  end
  object ResultsVidOpl: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      '')
    DataSource = ResultsDataSource
    Left = 8
    Top = 112
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DataSourceVidOpl: TDataSource
    DataSet = ResultsVidOpl
    Left = 40
    Top = 112
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'ResultsDataSource'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_MAN=ID_MAN'
      'VIDOPL_CODE=VIDOPL_CODE'
      'VIDOPL_FULL=VIDOPL_FULL'
      'PERIOD=PERIOD'
      'ID_SM=ID_SM'
      'SMETA_KOD=SMETA_KOD'
      'FIO=FIO'
      'FZP=FZP'
      'FSS=FSS'
      'FBL=FBL')
    DataSource = DSource_Print
    Left = 104
    Top = 144
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40029.638656319400000000
    ReportOptions.LastChange = 40030.619250208300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 72
    Top = 144
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'ResultsDataSource'
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
      BottomMargin = 5.291666666666670000
      object ReportTitle1: TfrxReportTitle
        Height = 20.000000000000000000
        Top = 16.000000000000000000
        Width = 718.110700000000000000
      end
      object PageHeader1: TfrxPageHeader
        Height = 18.000000000000000000
        Top = 56.000000000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Left = 636.000000000000000000
          Width = 82.000000000000000000
          Height = 18.000000000000000000
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1051#1051)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 556.000000000000000000
          Width = 80.000000000000000000
          Height = 18.000000000000000000
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1047#1057)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 476.000000000000000000
          Width = 80.000000000000000000
          Height = 18.000000000000000000
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1047#1055)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 396.000000000000000000
          Width = 80.000000000000000000
          Height = 18.000000000000000000
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1102#1076#1078#1077#1090)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 100.000000000000000000
          Width = 296.000000000000000000
          Height = 18.000000000000000000
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076' '#1086#1087#1083#1072#1090#1080)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 40.000000000000000000
          Width = 60.000000000000000000
          Height = 18.000000000000000000
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1076)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Width = 40.000000000000000000
          Height = 18.000000000000000000
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'.')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 16.000000000000000000
        Top = 212.000000000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'ResultsDataSource'
        RowCount = 0
        Stretched = True
        object Memo3: TfrxMemoView
          Left = 40.000000000000000000
          Width = 60.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'ResultsDataSource'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ResultsDataSource."VIDOPL_CODE"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 100.000000000000000000
          Width = 296.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataField = 'VIDOPL_FULL'
          DataSet = frxDBDataset1
          DataSetName = 'ResultsDataSource'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ResultsDataSource."VIDOPL_FULL"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 396.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataField = 'SMETA_KOD'
          DataSet = frxDBDataset1
          DataSetName = 'ResultsDataSource'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ResultsDataSource."SMETA_KOD"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 476.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'ResultsDataSource'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ResultsDataSource."FZP"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 556.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataField = 'FSS'
          DataSet = frxDBDataset1
          DataSetName = 'ResultsDataSource'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ResultsDataSource."FSS"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 636.000000000000000000
          Width = 82.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataField = 'FBL'
          DataSet = frxDBDataset1
          DataSetName = 'ResultsDataSource'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ResultsDataSource."FBL"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 368.000000000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 638.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.000000000000000000
        Top = 136.000000000000000000
        Width = 718.110700000000000000
        Condition = 'ResultsDataSource."FIO"'
        object Memo2: TfrxMemoView
          Width = 718.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo9: TfrxMemoView
          Width = 476.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ResultsDataSource."FIO"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.000000000000000000
        Top = 288.000000000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Left = 556.000000000000000000
          Width = 80.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ResultsDataSource."FSS">,MasterData1)]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 636.000000000000000000
          Width = 82.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ResultsDataSource."FBL">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 476.000000000000000000
          Width = 80.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ResultsDataSource."FZP">,MasterData1)]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 16.000000000000000000
        Top = 176.000000000000000000
        Width = 718.110700000000000000
        Condition = 'ResultsDataSource."PERIOD"'
        object Memo11: TfrxMemoView
          Width = 718.000000000000000000
          Height = 16.000000000000000000
          DataSet = frxDBDataset1
          DataSetName = 'ResultsDataSource'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.Strings = (
            #1055#1077#1088#1110#1086#1076': [ResultsDataSource."PERIOD"]')
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 18.000000000000000000
        Top = 248.000000000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          Left = 556.000000000000000000
          Width = 80.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ResultsDataSource."FSS">,MasterData1)]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 636.000000000000000000
          Width = 82.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ResultsDataSource."FBL">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 476.000000000000000000
          Width = 80.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ResultsDataSource."FZP">,MasterData1)]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Width = 40.000000000000000000
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object DSet_Print: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT id_man, vidopl_code, vidopl_full, period, id_sm, smeta_ko' +
        'd, fio, fzp, fss, fbl FROM NEW_PROCE('#39'01.04.2009'#39', '#39'31.07.2009'#39',' +
        ' null, null, null, null, null, null, null, null)order by fio col' +
        'late win1251_ua, ID_MAN, period')
    Left = 72
    Top = 176
    poSQLINT64ToBCD = True
  end
  object DSource_Print: TDataSource
    DataSet = DSet_Print
    Left = 104
    Top = 176
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 136
    Top = 144
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 136
    Top = 176
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
    Left = 136
    Top = 208
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 136
    Top = 240
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 136
    Top = 272
  end
end
