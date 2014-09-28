object fmRegSCH: TfmRegSCH
  Left = 227
  Top = 145
  Width = 793
  Height = 593
  Caption = #1056#1077#1108#1089#1090#1088' '#1088#1072#1093#1091#1085#1082#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object trlSchet: TcxDBTreeList
    Left = 0
    Top = 72
    Width = 785
    Height = 443
    Styles.Background = cxBackground
    Styles.Content = cxsContent
    Styles.Inactive = cxsInactive
    Styles.Selection = cxsSelection
    Styles.BandHeader = cxsHeader
    Styles.ColumnFooter = cxsFooter
    Styles.ColumnHeader = cxsColumnHeader
    Styles.ContentEven = cxsContentEvent
    Styles.ContentOdd = cxsContentOdd
    Styles.HotTrack = cxHotTrack
    Styles.Indicator = cxsIndicator
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1056#1077#1082#1074#1110#1079#1080#1090#1080' '#1088#1072#1093#1091#1085#1082#1072
        Options.OnlyOwnColumns = True
        Width = 282
      end
      item
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1084#1110#1089#1103#1094#1103
        MinWidth = 150
        Options.OnlyOwnColumns = True
        Width = 180
      end
      item
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1054#1073#1086#1088#1086#1090#1080
        MinWidth = 150
        Options.OnlyOwnColumns = True
        Width = 180
      end
      item
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1082#1110#1085#1077#1094#1100' '#1084#1110#1089#1103#1094#1103
        MinWidth = 150
        Options.OnlyOwnColumns = True
        Width = 180
      end>
    BufferedPaint = True
    DataController.DataSource = dsrSchet
    DataController.ParentField = 'OUT_ID_PARENT_SCH'
    DataController.KeyField = 'OUT_ID_SCH'
    OptionsBehavior.ConfirmDelete = False
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.HotTrack = True
    OptionsBehavior.IncSearchItem = cmnSCH_NUMBER
    OptionsBehavior.IncSearch = True
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsView.CellEndEllipsis = True
    OptionsView.Bands = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.ExtPaintStyle = True
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    OptionsView.IndicatorWidth = 10
    RootValue = -6
    TabOrder = 0
    OnDblClick = trlSchetDblClick
    OnKeyDown = trlSchetKeyDown
    object cmnID_SCH: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      DataBinding.FieldName = 'OUT_ID_SCH'
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
    end
    object cmnID_PARENT_SCH: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      DataBinding.FieldName = 'OUT_ID_PARENT_SCH'
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
    end
    object cmnSCH_NUMBER: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #8470
      DataBinding.FieldName = 'OUT_SCH_NUMBER'
      MinWidth = 110
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      Width = 110
    end
    object cmnSCH_TITLE: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1053#1072#1079#1074#1072
      DataBinding.FieldName = 'OUT_SCH_TITLE'
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 155
    end
    object cmnKR_SUMMA: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1050#1088#1077#1076#1080#1090
      DataBinding.FieldName = 'OUT_KR_SUMMA'
      MinWidth = 74
      Options.Footer = True
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 2
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.Kind = skSum
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_KR_SUMMA'
      Width = 84
    end
    object cmnDB_SUMMA: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1044#1077#1073#1077#1090
      DataBinding.FieldName = 'OUT_DB_SUMMA'
      MinWidth = 74
      Options.Footer = True
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 2
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.Kind = skSum
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_DB_SUMMA'
      Width = 86
    end
    object cmn_KR_SALDO_CUR: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1050#1088#1077#1076#1080#1090
      DataBinding.FieldName = 'OUT_KR_SALDO_CUR'
      MinWidth = 74
      Options.Footer = True
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 3
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.Kind = skSum
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_KR_SALDO_CUR'
      Width = 84
    end
    object cmnDB_SALDO_CUR: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1044#1077#1073#1077#1090
      DataBinding.FieldName = 'OUT_DB_SALDO_CUR'
      MinWidth = 74
      Options.Footer = True
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 3
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.Kind = skSum
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_DB_SALDO_CUR'
      Width = 85
    end
    object cmnDB_SALDO_INPUT: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1044#1077#1073#1077#1090
      DataBinding.FieldName = 'OUT_DB_SALDO_INPUT'
      MinWidth = 74
      Options.Footer = True
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 1
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.Kind = skSum
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_DB_SALDO_INPUT'
      Width = 85
    end
    object cmnKR_SALDO_INPUT: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1050#1088#1077#1076#1080#1090
      DataBinding.FieldName = 'OUT_KR_SALDO_INPUT'
      MinWidth = 74
      Options.Footer = True
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 1
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.Kind = skSum
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_KR_SALDO_INPUT'
      Width = 84
    end
    object cmnHAS_CHILDREN: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      DataBinding.FieldName = 'OUT_HAS_CHILDREN_BOOLEAN'
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
    end
  end
  object pnlDescription: TPanel
    Left = 0
    Top = 523
    Width = 785
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    object cbxIsSchClosed: TcxDBCheckBox
      Left = 3
      Top = 0
      Width = 156
      Height = 21
      DataBinding.DataField = 'OUT_IS_OPEN_BOOLEAN'
      DataBinding.DataSource = dsrSchet
      ParentColor = False
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 0
      Properties.ValueUnchecked = '1'
      Properties.Caption = #1056#1072#1093#1091#1085#1086#1082' '#1079#1072#1082#1088#1080#1090#1086
      TabOrder = 0
    end
    object cbxIsSchLocked: TcxDBCheckBox
      Left = 3
      Top = 21
      Width = 156
      Height = 21
      DataBinding.DataField = 'OUT_IS_LOCKED_BOOLEAN'
      DataBinding.DataSource = dsrSchet
      ParentColor = False
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Properties.Caption = #1056#1072#1093#1091#1085#1086#1082' '#1079#1072#1073#1083#1086#1082#1086#1074#1072#1085#1086
      TabOrder = 1
    end
  end
  object Splitter1: TcxSplitter
    Left = 0
    Top = 515
    Width = 785
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    AlignSplitter = salBottom
    Control = pnlDescription
  end
  object brmSchet: TdxBarManager
    AlwaysSaveText = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        Caption = #1055#1072#1085#1077#1083#1100' '#1076#1110#1081
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnWatch
            Visible = True
          end
          item
            Item = btnFilter
            Visible = True
          end
          item
            Item = btnPrint
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnOpenSch
            Visible = True
          end
          item
            Item = btnCloseSch
            Visible = True
          end
          item
            Item = btnSelect
            Visible = True
          end
          item
            Item = btnExit
            Visible = True
          end>
        Name = 'tlbSchet'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        Caption = #1055#1072#1085#1077#1083#1100' '#1092#1110#1083#1100#1090#1088#1072#1094#1110#1111
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 48
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 39
        FloatClientHeight = 38
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemLinks = <
          item
            Item = edtMonth
            Visible = True
          end
          item
            Item = edtYear
            Visible = True
          end
          item
            Item = edtRegUch
            Visible = True
          end>
        Name = 'tlbFilter'
        NotDocking = [dsLeft, dsRight]
        OneOnRow = True
        Row = 1
        UseOwnFont = True
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Edit'
      'Filter'
      'Default')
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    FlatCloseButton = True
    LargeImages = imlToolBar
    LargeIcons = True
    MenuAnimations = maUnfold
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 20
    Top = 408
    DockControlHeights = (
      0
      0
      72
      0)
    object btnAdd: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      ImageIndex = 0
      AutoGrayScale = False
    end
    object btnEdit: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Visible = ivAlways
      ImageIndex = 1
      AutoGrayScale = False
    end
    object btnDelete: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      ImageIndex = 2
      AutoGrayScale = False
    end
    object btnWatch: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076
      Category = 0
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1080#1102' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091' '#1089#1095#1105#1090#1091
      Visible = ivAlways
      ImageIndex = 3
      ShortCut = 114
      OnClick = btnWatchClick
      AutoGrayScale = False
    end
    object btnPrint: TdxBarLargeButton
      Caption = #1044#1088#1091#1082
      Category = 0
      Hint = #1044#1088#1091#1082
      Visible = ivAlways
      ImageIndex = 13
      OnClick = btnPrintClick
      AutoGrayScale = False
    end
    object btnRefresh: TdxBarLargeButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1054#1085#1086#1074#1080#1090#1080' '#1076#1072#1085#1110
      Visible = ivAlways
      ImageIndex = 4
      ShortCut = 116
      OnClick = btnRefreshClick
      AutoGrayScale = False
    end
    object btnFilter: TdxBarLargeButton
      Caption = #1060#1110#1083#1100#1090#1088
      Category = 0
      Hint = #1055#1088#1080#1081#1085#1103#1090#1080' '#1092#1110#1083#1100#1090#1088
      Visible = ivAlways
      ImageIndex = 10
      ShortCut = 117
      OnClick = btnFilterClick
      AutoGrayScale = False
    end
    object edtMonth: TdxBarCombo
      Caption = #1055#1086#1090#1086#1095#1085#1080#1081' '#1087#1077#1088#1110#1086#1076': '
      Category = 1
      Hint = #1052#1077#1089#1103#1094' '
      Visible = ivAlways
      OnCurChange = edtMonthCurChange
      ShowCaption = True
      Width = 100
      ShowEditor = False
      Items.Strings = (
        '01 - '#1071#1085#1074#1072#1088#1100
        '02 - '#1060#1077#1074#1088#1072#1083#1100
        '03 - '#1052#1072#1088#1090
        '04 - '#1040#1087#1088#1077#1083#1100
        '05 - '#1052#1072#1081
        '06 - '#1048#1102#1085#1100
        '07 - '#1048#1086#1083#1100
        '08 - '#1040#1074#1075#1091#1089#1090
        '09 - '#1057#1077#1085#1090#1103#1073#1088#1100
        '10 - '#1054#1082#1090#1103#1073#1088#1100
        '11 - '#1053#1086#1103#1073#1088#1100
        '12 - '#1044#1077#1082#1072#1073#1088#1100)
      Sorted = True
      ItemIndex = -1
    end
    object edtYear: TdxBarCombo
      Caption = #1056#1110#1082': '
      Category = 1
      Hint = #1043#1086#1076
      Visible = ivAlways
      Text = '2005'
      OnCurChange = edtYearCurChange
      Width = 100
      ShowEditor = False
      Items.Strings = (
        '2005'
        '2006')
      Sorted = True
      ItemIndex = 0
    end
    object edtRegUch: TdxBarCombo
      Align = iaRight
      Caption = #1056#1077#1075#1110#1089#1090#1088' '#1086#1073#1083#1110#1082#1091': '
      Category = 1
      Hint = #1058#1077#1082#1091#1097#1080#1081' '#1088#1077#1075#1080#1089#1090#1088' '#1091#1095#1105#1090#1072
      Visible = ivAlways
      ShowCaption = True
      Width = 200
      ShowEditor = False
      DropDownCount = 5
      Sorted = True
      ItemIndex = -1
    end
    object btnCloseSch: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080
      Category = 0
      Hint = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1091' '#1085#1072#1089#1090#1091#1087#1085#1080#1081' '#1087#1077#1088#1110#1086#1076
      Visible = ivAlways
      ImageIndex = 11
      ShortCut = 16417
      OnClick = btnCloseSchClick
      AutoGrayScale = False
    end
    object btnOpenSch: TdxBarLargeButton
      Caption = #1042#1110#1076#1082#1086#1090#1080#1090#1080
      Category = 0
      Hint = #1042#1110#1076#1082#1086#1090#1080#1090#1080' '#1087#1086#1090#1086#1095#1085#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1091' '#1087#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1087#1077#1088#1110#1086#1076
      Visible = ivAlways
      ImageIndex = 12
      ShortCut = 16418
      OnClick = btnOpenSchClick
      AutoGrayScale = False
    end
    object btnSelect: TdxBarLargeButton
      Caption = #1042#1080#1073#1088#1072#1090#1080
      Category = 0
      Hint = #1042#1080#1073#1088#1072#1090#1080' '#1088#1072#1093#1091#1085#1086#1082
      Visible = ivAlways
      ImageIndex = 5
      ShortCut = 13
      OnClick = btnSelectClick
      AutoGrayScale = False
    end
    object btnExit: TdxBarLargeButton
      Caption = #1042#1080#1093#1110#1076
      Category = 0
      Hint = #1047#1072#1082#1088#1080#1090#1080' '#1088#1077#1108#1089#1090#1088' '#1088#1072#1093#1091#1085#1082#1110#1074
      Visible = ivAlways
      ImageIndex = 6
      ShortCut = 27
      OnClick = btnExitClick
      AutoGrayScale = False
    end
  end
  object dsrSchet: TDataSource
    DataSet = dstSchet
    Left = 175
    Top = 459
  end
  object dstSchet: TpFIBDataSet
    Database = dbSchet
    Transaction = trWrite
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    AutoUpdateOptions.KeyFields = 'OUT_ID_SCH'
    Left = 281
    Top = 459
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object dstRegUch: TpFIBDataSet
    Database = dbSchet
    Transaction = trRead
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    UpdateTransaction = trWrite
    Left = 229
    Top = 459
    poSQLINT64ToBCD = True
  end
  object spcSchet: TpFIBStoredProc
    Database = dbSchet
    Transaction = trWrite
    Left = 333
    Top = 459
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38652.554073344900000000
    ReportOptions.LastChange = 38676.612268877320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '{ if ((<DBDataset."OUT_ID_SCH"> < 0)'
      ' and (<DBDataset."OUT_HAS_CHILDREN_BOOLEAN"> = 1)) then begin'
      '  TfrxMemoView(Sender).Visible := False;'
      '  TfrxMemoView(Sender).Height  := 0;'
      '  Exit;'
      ' end'
      ' else TfrxMemoView(Sender).Visible := True;'
      ''
      ' if <DBDataset."OUT_HAS_CHILDREN_BOOLEAN"> = 1 then begin'
      '  TfrxMemoView(Sender).Color      := $00E2E2E2;'
      '  TfrxMemoView(Sender).Font.Style := fsBold;'
      ' end'
      ' else begin'
      '  TfrxMemoView(Sender).Color      := clNone;'
      '  TfrxMemoView(Sender).Font.Style := nil;'
      ' end;}'
      ''
      
        ' if ( <DBDataset."OUT_ID_SCH"> < 0 ) and ( <DBDataset."OUT_ID_PA' +
        'RENT_SCH"> < 0 )'
      ' then begin'
      '//   MasterData1.Visible = False;'
      ' end'
      ' else begin'
      '//   MasterData1.Visible = True;'
      ' end;'
      ''
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '    i : Integer;'
      'begin'
      ''
      ' i := <DBDataset."OUT_ID_SCH">;'
      ''
      ' if    ( <DBDataset."OUT_ID_PARENT_SCH"> > 0)'
      '   and ( <DBDataset."OUT_ID_PARENT_SCH"> <> i )'
      ' then begin'
      '  TfrxGroupHeader(Sender).StartNewPage := True;'
      ' end'
      ' else begin'
      '  TfrxGroupHeader(Sender).StartNewPage := False;'
      ' end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 125
    Top = 459
    Datasets = <
      item
        DataSet = DBDataset
        DataSetName = 'DBDataset'
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
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        DataSet = DBDataset
        DataSetName = 'DBDataset'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_SCH_NUMBER'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_SCH_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 79.370130000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_SCH_TITLE'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."OUT_SCH_TITLE"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SALDO_CUR'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_DB_SALDO_CUR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SALDO_CUR'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_KR_SALDO_CUR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 480.000310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SUMMA'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_KR_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 400.630180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SUMMA'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_DB_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 321.260050000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SALDO_INPUT'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_KR_SALDO_INPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 241.889920000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SALDO_INPUT'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_DB_SALDO_INPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        Height = 56.692950000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Width = 79.370130000000000000
          Height = 56.692950000000000000
          Color = 13092807
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 79.370130000000000000
          Width = 162.519790000000000000
          Height = 56.692950000000000000
          Color = 13092807
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1077#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 241.889920000000000000
          Width = 158.740260000000000000
          Height = 37.795300000000000000
          Color = 13092807
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1074#1089#1090#1091#1087#1080#1090#1077#1083#1100#1085#1086#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 321.260050000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 241.889920000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 400.630180000000000000
          Width = 158.740260000000000000
          Height = 37.795300000000000000
          Color = 13092807
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1099)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 480.000310000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 400.630180000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 37.795300000000000000
          Color = 13092807
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1082#1086#1085#1077#1094' '#1084#1077#1089#1103#1094#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 638.740570000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 15000804
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 128.504020000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo21: TfrxMemoView
          Left = 128.504020000000000000
          Width = 529.134200000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'times new roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1044#1074#1080#1078#1077#1085#1080#1077' '#1089#1088#1077#1076#1089#1090#1074' '#1087#1086' '#1089#1095#1077#1090#1072#1084' '#1079#1072#1088#1072#1073#1086#1090#1085#1086#1081' '#1087#1083#1072#1090#1099' '#1080' '#1089#1090#1080#1087#1077#1085#1076#1080#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 143.622140000000000000
          Top = 71.811070000000000000
          Width = 498.897960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'times new roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' [Period]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Width = 98.267780000000000000
          Height = 79.370130000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[Visa]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 430.866420000000000000
        Width = 718.110700000000000000
        object Memo20: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1088'. [<Page#>] '#1080#1079' [<TotalPages#>]')
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'DBDataset."OUT_ID_PARENT_SCH"'
        StartNewPage = True
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 351.496290000000000000
        Visible = False
        Width = 718.110700000000000000
        object Memo24: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_SCH_NUMBER'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_SCH_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 79.370130000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_SCH_TITLE'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."OUT_SCH_TITLE"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 559.370440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SALDO_CUR'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_DB_SALDO_CUR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SALDO_CUR'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_KR_SALDO_CUR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 480.000310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SUMMA'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_KR_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 400.630180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SUMMA'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_DB_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 321.260050000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SALDO_INPUT'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_KR_SALDO_INPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 241.889920000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SALDO_INPUT'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."OUT_DB_SALDO_INPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSet = dstSchet
    Left = 125
    Top = 407
  end
  object dstBuffer: TRxMemoryData
    FieldDefs = <>
    Left = 72
    Top = 407
    object fldSCH_NUMBER: TStringField
      FieldName = 'SCH_NUMBER'
      Size = 60
    end
    object fldSCH_TITLE: TStringField
      FieldName = 'SCH_TITLE'
      Size = 120
    end
    object fldSCH_ERROR: TStringField
      FieldName = 'SCH_ERROR'
      Size = 255
    end
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dbSchet
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'concurrency')
    TPBMode = tpbDefault
    UserKindTransaction = 'ktrWrite'
    Left = 276
    Top = 408
  end
  object dbSchet: TpFIBDatabase
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 180
    Top = 408
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dbSchet
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    UserKindTransaction = 'ktrRead'
    Left = 227
    Top = 408
  end
  object srpMain: TcxStyleRepository
    Left = 20
    Top = 460
    object cxsHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxsContentEvent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxsContentOdd: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxsContent: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxsGroupByBox: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 46585
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxsIndicator: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxsSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 46585
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxBackground: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxHotTrack: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13105918
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxsColumnHeaderClassic: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16445675
      TextColor = 12937777
    end
    object cxsInactive: TcxStyle
      AssignedValues = [svColor]
      Color = 13291229
    end
    object cxsColumnHeader: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13562367
      TextColor = clBlack
    end
    object cxsFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13562367
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
  end
  object imlToolBar: TImageList
    Height = 24
    Width = 24
    Left = 72
    Top = 460
    Bitmap = {
      494C01010E001300040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000078000000010020000000000000B4
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4676900A66A6B00A6696B00A6696A00A6696A00A5696A00A569
      6A00A5696A00A6696A00A6696A00A46769000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA707000FFFED700FAE2B700FBE0AD00F8D9A000F6D19100F4CC
      8600F3CA8200F8D48400FCD48400A5696A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA6F7000FFF6D800F2D9BB008087CF002C46E6000323FB002B44
      DE007B79AF00EEC28000F4CB8200A5696A000000000000000000000000000000
      000000000000000000006C6A6A006C6A6A006C6A6A0000000000000000000000
      0000000000006C6A6A006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AB757200FFFCE600828CDC000222FE00001EFF00001EFF00001E
      FF000221FC007F7EB000F4CB8200A5696A000000000000000000000000000000
      0000000000006C6A6A00B0ADAD00969293008E8A8B006C6A6A006C6A6A00817E
      7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AC7F7500FFFFF6002D4BF200001EFF00001EFF00001EFF00001E
      FF00001EFF002C46DE00F6CE8900A5696A000000000000000000000000000000
      00006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F9F00838182005C5B
      5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9C9006C6A6A006C6A
      6A006C6A6A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5837400FFFFFF000323FE00001EFF00001EFF00001EFF00001E
      FF00001EFF000323FB00F8D39600A5696A000000000000000000000000006C6A
      6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F9F00626060000000
      000000000000161616005D5D5D00A9A9A900CACACA00CACACA00CACACA00CACA
      CA00C1C0C0006C6A6A006C6A6A006C6A6A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE957500FFFFFF002D4EFA00001EFF00001EFF00001EFF00001E
      FF00001EFF002D48E600FFE0A400A6696A0000000000000000006C6A6A00D3D3
      D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F7F006C6A6A001414
      140008080800000000000000000000000000161616005D5D5D00A9A9A900CACA
      CA00CACACA00B7B6B600B7B6B6006C6A6A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D59A7700FFFFFF00889DFC000222FF00001EFF00001EFF00001E
      FF000222FE008692D700E0C2A000A5686A00000000006C6A6A00CACACA00CACA
      CA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F9F009F9D9D009997
      97009390910082808000525050002B2A2A000808080000000000000000001616
      160064646400817E7F006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DCA17D00FFFFFF00FFFFFF00889EFF002E50FC000324FE002D4D
      F4007E84D500CBAF9800AF8B7B00A3676B00000000006C6A6A00CACACA00C5C5
      C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DEDE00CAC7C700B6B5
      B500A5A3A300A19F9F00A19F9F009E9A9C009390910068656600232223000303
      030019191900999797006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DCA37E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00F8F0
      E700BD908200A36B64009F6B6500AC695900000000006C6A6A00C5C5C5008E8C
      8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEEDED00EAEAEA00E7E6
      E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F9F00999797008280
      80006C6A6A009F9D9D006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      690000000000E7B08200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F6
      FA00AF828200D18A4F00D4894A0000000000000000006C6A6A008E8C8C00EFEE
      EE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B7E00958B8E00C1BF
      BF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1C100B2B0B000A19F
      9F009C9999006C6A6A006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4676900FEE9C700F4DAB500F6D9
      AB00F4D4A000F2CE9500F0C78800EFC58100EEC58000F4CC8300EFC48000A467
      690000000000E9B08100FBFAFB00FAF3EF00FAF3EF00FAF3EF00FCF8F400EEE0
      D800B07F7600B67660000000000000000000000000006C6A6A00CECBCC00F7F6
      F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADABAB009E9898008379
      7B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1D100CECECE00C9C7
      C700BBBABA00A6A4A4006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4676900FCEACE00F3DABC00F0D5
      B400F0D0A900EECB9E00EDC69300EAC08800E9BC7F00EFC58100EFC48000A467
      690000000000E6A97800CF906C00D1926D00D1926D00D1926D00D1926D000562
      0A000A6E120000000000000000000000000000000000000000006C6A6A006C6A
      6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C0083787A009C969700ACAA
      AA00B2B0B000ABA7A9009891920081777800847A7D00938C8E00BFBFBF00CBCB
      CB00CACACA00C0C0C0006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4676900E7C6AC00973D1700963D
      1600963C1500963B1300963A13009539110095380F00B4642F00EFC48000A467
      6900000000000000000000000000000000000000000000000000005201001A92
      2F0042E075000155030000000000000000000000000000000000000000000000
      00006C6A6A006C6A6A00BD828100AF8A73007D5E510066545600655457006D5E
      62006D5E620089808100A09A9C00AFACAD00B2B0B000A49FA000CAC9CA00CBCB
      CB00B7B6B6006C6A6A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7756B00FFF4E500A4512C00811E
      0000811E0000811E0000811E0000811E000083200100E0AB6F00EFC58300A467
      69000000000000000000000000000000000000000000004F0000138423003ED9
      6F0045E67A002DC24F0001550300000000000000000000000000000000000000
      00000000000000000000BD828100FFD4AB00FFD0A100FFCB9800D5A57B00A178
      5C007B665F0060505300665659006F6265008E868700CECCCC00CFCFCF00A5A4
      A4006C6A6A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7756B00FFFFFC00E6C7B2008321
      0100811E0000811E0000811E0000811E0000B0643700F0CE9300F2C98C00A467
      690000000000000000000000000000000000015503000F821C0035C660003FDC
      6F0030C6560018A92D0015A42800015503000000000000000000000000000000
      00000000000000000000BD828100FFD9B200FFD4A900FFCFA000FFCA9700FFC6
      8E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A6A006C6A6A006C6A
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC826800FFFFFC00FAF0E600B875
      5500811E0000811E0000811E00008A2B0700EBC59C00F3D3A000F3CE9700A467
      6900000000000000000000000000000000000155030001550300015503001CA0
      350023BC41000155030001550300015503000000000000000000000000000000
      00000000000000000000BD828100FFDDBA00FFD8B100FFD3A700FFCE9E00FFCA
      9600FFC58C00FFC08400FFC08400BD8281000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1926D00FFFFFC00FEF7F200F6E9
      E1008E2F0C00811E0000811E0000C4866200F4D7B500FBDCAD00F6D3A000A467
      6900000000000000000000000000000000000000000000000000004C00000B7B
      16001BB733000155030000000000000000000000000000000000000000000000
      000000000000BD828100FFE5CB00FFE1C200FFDCB800FFD7AF00FFD3A600FFCE
      9D00FFC99500FFC48B00BD828100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1926D00FFFFFC00FFFFFF00FFFE
      FE00CF9D8400811E0000983E1900F8E5CC00F8E3C500EBD9B700C5A48F00A467
      6900000000000000000000000000000000000000000000000000015403000978
      11000EA51D000155030000000000000000000000000000000000000000000000
      000000000000BD828100FFEAD400FFE5CA00FFE0C000FFDAB700FFD7AD00FFD1
      A500FFCC9C00FFC79200BD828100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DA9D7500FFFFFC00FFFFFF00FFFF
      FF00FFFEFE009A442000E0BBA500F4E3D100D5B19F00B7928000A77D7000A467
      6900000000000000000000000000000000000000000000000000035F0600067F
      0D00069810000155030000000000000000000000000000000000000000000000
      000000000000BD828100FFEEDC00FFE9D100FFE3C900FFE0BF00FFDAB600FFD5
      AC00FFD0A300F7C29700BD828100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DA9D7500FFFFFC00FFFFFF00FFFF
      FF00FFFFFF00F3E7E000FFFEF800E6D5CC00A56B5F00A56B5F00A56B5F00AF6A
      5600000000000000000000000000000000000000000000000000036907000692
      0E0005840C000155030000000000000000000000000000000000000000000000
      0000BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3C700FFDEBD00FFD9
      B400FFD4AB00BD82810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900FFFFFC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E2D9DC00A56B5F00E1974E00D38749000000
      00000000000000000000000000000000000000000000036E0700068F0D000589
      0C0001550300000000000000000000000000000000000000000000000000BD82
      8100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7CF00FFE2C500FFDD
      BC00F2C7A900BD82810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900FAF3EF00FAF3EF00FAF3
      EF00FAF3EF00FAF3EF00FAF3EF00DCC2B800A56B5F00BF7D6000000000000155
      03000155030001540300025C0500056F0C00057E0C0004800B00037208000155
      030000000000000000000000000000000000000000000000000000000000BD82
      8100BD828100BD828100BD828100FFF4EB00FFF0E100FFEBD700FFE6CE00FBDC
      C000BD8281000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900D1926D00D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00A56B5F0000000000000000000000
      00000155030001550300025C0400025B0500025C040002580300015403000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD828100BD828100BD828100BD828100BD82
      8100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009263
      5D00A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A467690000000000000000000000000000000000000000009263
      5D00A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B0000004B
      0000004B0000004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4676900A66A6B00A6696B00A6696A00A6696A00A5696A00A569
      6A00A5696A00A6696A00A6696A00A46769000000000000000000000000009365
      5E00FFDCB700FFDAB500FED9B100FED8AF00FED7AB00FED5A700FED4A500FED3
      A300FED0A000FECF9F00FECE9D00FECE9A00FECC9800FECB9600FECB9600FECB
      9600FECB96009F6F600000000000000000000000000000000000000000009365
      5E00FFDCB700FFDAB500FED9B100FED8AF00FED7AB00FED5A700FED4A500FED3
      A300FED0A000FECF9F00FECE9D00FECE9A00FECC9800FECB9600FECB9600FECB
      9600FECB96009F6F600000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B00005D9A5E0098DA
      AC003FA52B002A830000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA707000FFFED700FAE2B700FBE0AD00F8D9A000F6D19100F4CC
      8600F3CA8200F8D48400FCD48400A5696A000000000000000000000000009365
      5F00FEDEBC00FEDDB800FFDAB500FED9B200FED8AF00FED7AB00FED5AA00FED4
      A600FED3A400FED0A000FECF9E00FECF9D00FECE9C00FECE9900FECC9700FECB
      9600FECB96009F6F600000000000000000000000000000000000000000009365
      5F00FEDEBC00FEDDB800FFDAB500FED9B200FED8AF00FED7AB00FED5AA00FED4
      A600FED3A400FED0A000FECF9E00FECF9D00FECE9C00FECE9900FECC9700FECB
      9600FECB96009F6F600000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B00005D9A5E0098DA
      AC003FA52B002A830000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA6F7000FFF6D800F2D9BB008087CF002C46E6000323FB002B44
      DE007B79AF00EEC28000F4CB8200A5696A000000000000000000000000009365
      5F00FFE1C100FEE0BD00FEDDBA00FEDCB600FEDAB200FED8B000FED8AD00FED5
      AA00FED4A700FED3A400FED1A30000810000FECF9D00FFCE9C00FECE9900FECC
      9800FECC97009F6F600000000000000000000000000000000000000000009365
      5F00FFE1C100FEE0BD00FEDDBA00FEDCB600FEDAB200FED8B000FED8AD00FED5
      AA00FED4A700FED3A400FED1A30000810000FECF9D00FFCE9C00FECE9900FECC
      9800FECC97009F6F600000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B00005D9A5E0098DA
      AC003FA52B002A830000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AB757200FFFCE600828CDC000222FE00001EFF00001EFF00001E
      FF000221FC007F7EB000F4CB8200A5696A000000000000000000000000009365
      5F00FFE3C500FEE1C100FFE0BD00FFDEBB00FEDCB700FEDAB400FED9B100FFD8
      AD00FED5AB00FED4A900008100000081000000810000FED09E00FECF9D00FECC
      9900FECC98009F6F600000000000000000000000000000000000000000009365
      5F00FFE3C500FEE1C100FFE0BD00FFDEBB00FEDCB700FEDAB400FED9B100FFD8
      AD00FED5AB00FED4A900008100000081000000810000FED09E00FECF9D00FECC
      9900FECC98009F6F600000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B00005D9A5E0098DA
      AC003FA52B002A830000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AC7F7500FFFFF6002D4BF200001EFF00001EFF00001EFF00001E
      FF00001EFF002C46DE00F6CE8900A5696A000000000000000000000000009365
      6000FFE5CA00FEE3C600D5812700D5812700D5812700D5812700D5812700D581
      2700FED8AF000081000032772500648E43000081000054843700FECF9E00FECE
      9C00FECE9A009F6F600000000000000000000000000000000000000000009365
      6000FFE5CA00FEE3C600D5812700D5812700D5812700D5812700D5812700D581
      2700FED8AF000081000032772500648E43000081000054843700FECF9E00FECE
      9C00FECE9A009F6F600000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B00005D9A5E0098DA
      AC003FA52B002A830000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5837400FFFFFF000323FE00001EFF00001EFF00001EFF00001E
      FF00001EFF000323FB00F8D39600A5696A000000000000000000000000009566
      6000FFE7CE00FFE5CB00FFE5C700FEE2C400FEE0C000FEE0BC00FFDDBA00FEDC
      B600FFDAB20000810000F6D3A700FFD5AA00AFB174000081000000810000F8CE
      9C00FECF9D009F6F600000000000000000000000000000000000000000009566
      6000FFE7CE00FFE5CB00FFE5C700FEE2C400FEE0C000FEE0BC00FFDDBA00FEDC
      B600FFDAB20000810000F6D3A700FFD5AA00AFB174000081000000810000F8CE
      9C00FECF9D009F6F600000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000032A54B002EBB
      55001CA92F0014911000004F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE957500FFFFFF002D4EFA00001EFF00001EFF00001EFF00001E
      FF00001EFF002D48E600FFE0A400A6696A000000000000000000000000009869
      6300FFEAD300FEE9CF00FFE6CC00FEE5C900FEE3C400FEE1C100FEE0BD00FFDE
      BB00FEDCB600FEDAB400FED9B100FED7AD00FED5AB00EECE9E00008100000081
      0000FFD09F009F6F600000000000000000000000000000000000000000009869
      6300FFEAD300FEE9CF00FFE6CC00FEE5C900FEE3C400FEE1C100FEE0BD00FFDE
      BB00FEDCB600FEDAB400FED9B100FED7AD00FED5AB00EECE9E00008100000081
      0000FFD09F009F6F600000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B0000189D330023C553001AB6
      410011A72D000A9A1A0003810800004E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D59A7700FFFFFF00889DFC000222FF00001EFF00001EFF00001E
      FF000222FE008692D700E0C2A000A5686A000000000000000000000000009E6E
      6400FFEBD800FEEBD400FEE9D000FEE6CE00FEE5CA00FEE3C600FFE1C200FEE0
      BF00FFDEBC00FEDCB700FEDAB500FED9B100FED7AF00FED7AB00FED4A900FFD4
      A500FED1A3009F6F600000000000000000000000000000000000000000009E6E
      6400FFEBD800FEEBD400FEE9D000FEE6CE00FEE5CA00FEE3C600FFE1C200FEE0
      BF00FFDEBC00FEDCB700FEDAB500FED9B100FED7AF00FED7AB00FED4A900FFD4
      A500FED1A3009F6F600000000000000000000000000000000000000000000000
      0000000000000000000000000000004B00001DA539002DD35E0021C2500018B2
      3D0010A5280009981600038B070000770000004E000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DCA17D00FFFFFF00FFFFFF00889EFF002E50FC000324FE002D4D
      F4007E84D500CBAF9800AF8B7B00A3676B00000000000000000000000000A372
      6600FEEEDC00FFEDD800FEEAD400FEE9D100FFE7CE00FEE6CB00FFE3C600FEE2
      C400FEE1C000FEDEBC00FFDDB80000810000FED9B200FED9AF00FED7AB00FED5
      A900FED4A6009F6F60000000000000000000000000000000000000000000A372
      6600FEEEDC00FFEDD800FEEAD400FEE9D100FFE7CE00FEE6CB00FFE3C600FEE2
      C400FEE1C000FEDEBC00FFDDB80000810000FED9B200FED9AF00FED7AB00FED5
      A900FED4A6009F6F600000000000000000000000000000000000000000000000
      00000000000000000000004B000023AC400036E16A002ACF5B001FBF4D0016B0
      39000EA3240007961300028805000081000000760000004E0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DCA37E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00F8F0
      E700BD908200A36B64009F6B6500AC695900000000000000000000000000A775
      6800FFF0E000FEEEDD00D56A0000D56A0000D56A0000D56A0000D56A0000D56A
      0000FEE3C400FEE1C100008100000081000000810000FFDAB200FED8B000FED8
      AD00FED5AA009F6F62000000000000000000000000000000000000000000A775
      6800FFF0E000FEEEDD00FF535300FF535300FF535300FF535300FF535300FF53
      5300FEE3C400FEE1C100008100000081000000810000FFDAB200FED8B000FED8
      AD00FED5AA009F6F620000000000000000000000000000000000000000000000
      000000000000004B000028B4450041EF760034DD670028CC59001DBB490015AD
      35000DA0210006920F0001860300008100000081000000760000004E00000000
      000000000000000000000000000000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      690000000000E7B08200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F6
      FA00AF828200D18A4F00D4894A0000000000000000000000000000000000AC79
      6900FFF2E500FFF2E200FEEDED00FEEDED00FEEDED00FEEDED00FEEDED00FEED
      ED00FFE5C90000810000327A290064934C000081000054893E00FEDAB500FED9
      B100FED7AD00A07063000000000000000000000000000000000000000000AC79
      6900FFF2E500FFF2E200FFE8E800FFE8E800FFE8E800FFE8E800FFE8E800FFE8
      E800FFE5C90000810000327A290064934C000081000054893E00FEDAB500FED9
      B100FED7AD00A070630000000000000000000000000000000000000000000000
      0000004B000028B5450049FB80003EEB730031D9640026C956001CB8450013AB
      30000C9D1D0005900D000083010000810000008100000081000000760000004E
      000000000000000000000000000000000000A4676900FEE9C700F4DAB500F6D9
      AB00F4D4A000F2CE9500F0C78800EFC58100EEC58000F4CC8300EFC48000A467
      690000000000E9B08100FBFAFB00FAF3EF00FAF3EF00FAF3EF00FCF8F400EEE0
      D800B07F7600B67660000000000000000000D56A0000D56A0000D56A0000D56A
      0000D56A0000D56A0000D56A0000D56A0000D56A0000D56A0000D56A0000D56A
      0000FEE7CC0000810000F6E0C000FEE2C200AFBA84000081000000810000F8D9
      B100FED9B100A07264000000000000000000FF535300FF535300FF535300FF53
      5300FF535300FF535300FF535300FF535300FF535300FF535300FF535300FF53
      5300FEE7CC0000810000F6E0C000FEE2C200AFBA84000081000000810000F8D9
      B100FED9B100A07264000000000000000000000000000000000000000000004B
      000028B545004BFE820047F87E003BE76F002FD7620023C5530019B6410011A7
      2C000A9A1900048E0A0000820000008100000081000000810000008100000076
      0000004E0000000000000000000000000000A4676900FCEACE00F3DABC00F0D5
      B400F0D0A900EECB9E00EDC69300EAC08800E9BC7F00EFC58100EFC48000A467
      690000000000E6A97800CF906C00D1926D00D1926D00D1926D00D1926D00D797
      6E00AF746400000000000154030000000000D56A0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D56A
      0000FEEAD100FFE7CF00FEE6CA00FFE3C700FFE2C200EED9B500008100000081
      0000FEDCB6009D7065000000000000000000FF535300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF53
      5300FEEAD100FFE7CF00FEE6CA00FFE3C700FFE2C200EED9B500008100000081
      0000FEDCB6009D70650000000000000000000000000000000000004B00001E9E
      340034CC59001E9E34001C9A310010801E00076A0F0005670D0004640A000360
      0600015D0400005A01000058000000580000005E000000660000006600000073
      0000006F0000004E00000000000000000000A4676900E7C6AC00973D1700963D
      1600963C1500963B1300963A13009539110095380F00B4642F00EFC48000A467
      6900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025C0500025C0400FF5B5B00FFFFFF00310ABA00310A
      BA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00310ABA00FFFFFF00D56A
      0000FEEBD700FEEAD300FEE9CF00FEE6CC00FFE5C700FEE3C500FEE1C100FEE0
      BD00FEDDBB00896A63000000000000000000FF4F4F00FFFFFF00FFFFFF00FFFF
      FF00A7D8BC000080000000800000A7D8BC00FFFFFF00FFFFFF00FFFFFF00FF53
      5300FEEBD700FEEAD300FEE9CF00FEE6CC00FFE5C700FEE3C500FEE1C100FEE0
      BD00FEDDBB00896A6300000000000000000000000000004B0000004B0000004B
      000000580000006200000169020003760800078612000A8C1B00C0F3F80000D7
      F40000D7F40000D7F4000D5A640028BD4C0020A539001E9E3400148823000C73
      1500004B0000004B0000004B000000000000A7756B00FFF4E500A4512C00811E
      0000811E0000811E0000811E0000811E000083200100E0AB6F00EFC58300A467
      6900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000056F0C00025B0500FF555500FFFFFF000000FF00310A
      BA00310ABA00FFFFFF00FFFFFF00310ABA00310ABA00FFFFFF00FFFFFF00D56A
      0000FFEDDA00FFEDD700FFEAD40000810000FEE7CC00FEE5C900FFE3C600FFE1
      C200FEE1BF00806762000000000000000000FF535300FFFFFF0000800000A7D8
      BC0000800000A7D8BC00A7D8BC0000800000A7D8BC00FFFFFF00FFFFFF00FF53
      5300FFEDDA00FFEDD700FFEAD40000810000FEE7CC00FEE5C900FFE3C600FFE1
      C200FEE1BF00806762000000000000000000004B000000580000007600000081
      0000C47B0000C47B0000C47B0000C47B00000A9A1A000FA4280015AD3500C0F3
      F80000D7F40000D7F40000D7F4000D5A640045F67B004BFE82004BFE82004BFE
      82004BFE820034CC5900055E0800004B0000A7756B00FFFFFC00E6C7B2008321
      0100811E0000811E0000811E0000811E0000B0643700F0CE9300F2C98C00A467
      6900000000000000000000000000015503000155030000000000000000000000
      00000000000000000000057E0C00025C0400FF555500FFFFFF00FFFFFF00FFFF
      FF00310ABA00310ABA00310ABA00310ABA00FFFFFF00FFFFFF00FFFFFF00D56A
      0000FFF0DE00FEEEDC00008100000081000000810000FFE7CE00FFE6CB00FEE3
      C700FFE2C200846964000000000000000000FF535300FFFFFF00008000000080
      0000A7D8BC00FFFFFF00FFFFFF00A7D8BC0000800000FFFFFF00FFFFFF00FF53
      5300FFF0DE00FEEEDC00008100000081000000810000FFE7CE00FFE6CB00FEE3
      C700FFE2C20084696400000000000000000000000000004B000000510000C47B
      0000E6C65B00E3C15200E0B73B00DAAB1F00C47B00000FA4280015AD35001BB8
      4500C0F3F80000D7F40000D7F40000D7F4000D5A640033CC58001E9E34001993
      2B00FF78FF00004B0000004B000000000000BC826800FFFFFC00FAF0E600B875
      5500811E0000811E0000811E00008A2B0700EBC59C00F3D3A000F3CE9700A467
      69000000000000000000004F00000F821C000155030000000000000000000000
      000000000000036E070004800B0002580300FF555500FFFFFF00FFFFFF00FFFF
      FF000000FF00310ABA00310ABA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D56A
      0000FEF2E30000810000327D2E006499560000810000548F4700FFE7CF00FFE6
      CB00FFE5C700986859000000000000000000FF5B5B00FFFFFF00008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF53
      5300FEF2E30000810000327D2E006499560000810000548F4700FFE7CF00FFE6
      CB00FFE5C700986859000000000000000000000000000000000000000000B88F
      5500EFDC9800EDD78A00E7C96600E0B83B00C47B0000004B0000004B0000004B
      0000004B0000C0F3F80000D7F4000D5A6400004B0000004B0000004B0000FF78
      FF00FF78FF00760376000000000000000000D1926D00FFFFFC00FEF7F200F6E9
      E1008E2F0C00811E0000811E0000C4866200F4D7B500FBDCAD00F6D3A000A467
      690000000000005201001384230035C6600001550300004C000001540300035F
      060003690700068F0D000372080001540300FF5B5B00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF00310ABA00FFFFFF00FFFFFF00FFFFFF00D56A
      0000FEF3E70000810000F7EEDA00FFEFDE00AFC497000081000000810000F8E6
      CB00FFE7CB00A5686B000000000000000000FF5B5B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00008000000080000000800000FFFFFF00FF53
      5300FEF3E70000810000F7EEDA00FFEFDE00AFC497000081000000810000F8E6
      CB00FFE7CB00A5686B000000000000000000000000000000000000000000B88F
      5500F8F2D400F6E9BD00EDD78A00E3C15300C47B000000000000000000000000
      0000000000000000000054E6F700000000000000000000000000FAD5FA00FF78
      FF00FC00FC00760376007603760000000000D1926D00FFFFFC00FFFFFF00FFFE
      FE00CF9D8400811E0000983E1900F8E5CC00F8E3C500EBD9B700C5A48F00A467
      690005620A001A922F003ED96F003FDC6F001CA035000B7B160009781100067F
      0D0006920E0005890C000155030000000000FF5B5B00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00310ABA00310ABA00FFFFFF00FFFFFF00D56A
      0000FFF6EB00FFF4E900FFF3E500FFF2E200FFEFE000EFE6CF00008100000081
      0000FEE9D000846964000000000000000000FF5B5B00FFFFFF00FFFFFF000080
      0000A7D8BC00FFFFFF00FFFFFF00A7D8BC000080000000800000FFFFFF00FF53
      5300FFF6EB00FFF4E900FFF3E500FFF2E200FFEFE000EFE6CF00008100000081
      0000FEE9D000846964000000000000000000000000000000000000000000B88F
      5500FFFFFF00F8F2D400EFDC9800E5C65B00C47B000000000000000000000000
      00000000000000000000000000000000000000000000FAD5FA00FAD5FA00FC00
      FC00FC00FC00FC00FC007603760076037600DA9D7500FFFFFC00FFFFFF00FFFF
      FF00FFFEFE009A442000E0BBA500F4E3D100D5B19F00B7928000A77D7000A467
      69000A6E120042E0750045E67A0030C6560023BC41001BB733000EA51D000698
      100005840C00015503000000000000000000FF5B5B00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00D56A
      0000FFF7EF00FFF6EB00FEF4E900FFF3E600FEF2E300FFF0E000FFEFDD00FEED
      D900FEEBD500846964000000000000000000FF5B5B00FFFFFF00FFFFFF00A7D8
      BC0000800000A7D8BC00A7D8BC0000800000A7D8BC0000800000FFFBF400FF53
      5300FFF7EF00FFF6EB00FEF4E900FFF3E600FEF2E300FFF0E000FFEFDD00FEED
      D900FEEBD5008469640000000000000000000000000000000000000000000000
      0000B88F5500B88F5500B88F5500C47B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAD5FA00FAD5
      FA00FC00FC00760376007603760000000000DA9D7500FFFFFC00FFFFFF00FFFF
      FF00FFFFFF00F3E7E000FFFEF800E6D5CC00A56B5F00A56B5F00A56B5F00AF6A
      560000000000015503002DC24F0018A92D000155030001550300015503000155
      030001550300000000000000000000000000FF5B5B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00D56A
      0000FFF8F300FEF8F000FFF7EE00FFF4EA00FFF4E700FEF2E500FEF0E100FEEF
      DD00FFEDDA00846964000000000000000000FF5B5B00FFFFFF00FFFFFF00FFFF
      FF00A7D8BC000080000000800000A7D8BC00FFFFFF00FFFFFF00FFFBF800FF53
      5300FFF8F300FEF8F000FFF7EE00FFF4EA00FFF4E700FEF2E500FEF0E100FEEF
      DD00FFEDDA008469640000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAD5
      FA00FF78FF00760376000000000000000000E7AB7900FFFFFC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E2D9DC00A56B5F00E1974E00D38749000000
      000000000000000000000155030015A428000155030000000000000000000000
      000000000000000000000000000000000000FF5B5B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D56A
      0000CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800846964000000000000000000FF5B5B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF53
      5300CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68008469640000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF78FF00000000000000000000000000E7AB7900FAF3EF00FAF3EF00FAF3
      EF00FAF3EF00FAF3EF00FAF3EF00DCC2B800A56B5F00BF7D6000000000000000
      0000000000000000000000000000015503000155030000000000000000000000
      000000000000000000000000000000000000FF5B5B00FF5B5B00FF5B5B00FF5B
      5B00FF5B5B00FF5B5B00FF555500FF5B5B00FF5B5B00FF5B5B00D56A0000D56A
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF5B5B00FF5B5B00FF5B5B00FF5B
      5B00FF5B5B00FF5B5B00FF5B5B00FF535300FF4F4F00FF4F4F00FF535300FF53
      5300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900D1926D00D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00A56B5F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009263
      5D00A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A46769000000000000000000000000000000000092635D008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      590080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B008C4B4B00914B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5E00FFDCB700FFDAB500FED9B100FED8AF00FED7AB00FED5A700FED4A500FED3
      A300FED0A000FECF9F00FECE9D00FECE9A00FECC9800FECB9600FECB9600FECB
      9600FECB96009F6F60000000000000000000000000000000000093655E00EFD3
      B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC58900EBC1
      8200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC18000EABF
      7F0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B00894B4B009C4B4C00B64B4C00BD4B4C009F4B
      4C004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5F00FEDEBC00FEDDB800FFDAB500FED9B200FED8AF00FED7AB00FED5AA00FED4
      A600FED3A400FED0A000FECF9E00FECF9D00FECE9C00FECE9900FECC9700FECB
      9600FECB96009F6F60000000000000000000000000000000000093655F00EED4
      B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC58F00EBC1
      8800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009A4D4E00AF4E4F00C14E4F00C04D4E00BF4C4D00BF4C4D009F4B
      4C004E1E1F00994B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B0000000000000000000000000000000000000000009365
      5F00FFE1C100FEE0BD00FEDDBA00FEDCB600FEDAB200FED8B000FED8AD00FED5
      AA00FED4A700FED3A400FED1A30000810000FECF9D00FFCE9C00FECE9900FECC
      9800FECC97009F6F60000000000000000000000000000000000093655F00EED7
      C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC79600EDC5
      8F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00C5545500C9545500C7535400C6525300C5515200C4505100C24F5000A04C
      4D004E1E1F00FE8B8C00FC929300FB9A9C00FAA3A400F8AAAB00F7B1B100F7B5
      B600F7B5B600824B4B0000000000000000000000000000000000000000009365
      5F00FFE3C500FEE1C100FFE0BD00FFDEBB00FEDCB700FEDAB400FED9B100FFD8
      AD00FED5AB00FED4A900008100000081000000810000FED09E00FECF9D00FECC
      9900FECC98009F6F60000000000000000000000000000000000093655F00EFDA
      C500F7E2C700F3DCBF00F2D8B70000700000F0D1AA00EFCEA300B1B874000070
      00000070000000700000ADAD6000E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B0000118C1F00004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00CE585900CC575800CB565700CA555600C9545500C7535400C6525300A34E
      4F004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000009365
      6000FFE5CA00FEE3C600D5812700D5812700D5812700D5812700D5812700D581
      2700FED8AF000081000032772500648E43000081000054843700FECF9E00FECE
      9C00FECE9A009F6F60000000000000000000000000000000000093656000F0DE
      CC00F8E6CF00F6E0C600F3DCBD000070000004750300B2BD7F0000700000B1B8
      7400EDC79600B0B46B0000700000ADAF6200E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000004B0000138F230007931000169C2800004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D15B5C00D05A5B00CF595A00CE585900CC575800CB565700CA555600A550
      50004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000009566
      6000FFE7CE00FFE5CB00FFE5C700FEE2C400FEE0C000FEE0BC00FFDDBA00FEDC
      B600FFDAB20000810000F6D3A700FFD5AA00AFB174000081000000810000F8CE
      9C00FECF9D009F6F60000000000000000000000000000000000095666000F2E2
      D300FAEAD700F6E3CE00F4DEC500007000000070000000700000B2BD7F00EFCE
      A300EECB9D00EDC79700B0B46B0000700000E9BD8100E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      000000000000004B0000159127000FA01D000B99160008961100159A2700004B
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D55E5F00D55E5F00D45D5E00D35C5D00D15B5C00D05A5B00CF595A00A651
      52004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000009869
      6300FFEAD300FEE9CF00FFE6CC00FEE5C900FEE3C400FEE1C100FEE0BD00FFDE
      BB00FEDCB600FEDAB400FED9B100FED7AD00FED5AB00EECE9E00008100000081
      0000FFD09F009F6F60000000000000000000000000000000000098696300F2E6
      DA00FAEEDE00F7E7D400F6E2CB0000700000007000000070000000700000F0D1
      A900EFCEA300EECB9D00EDC7960000700000EBC18900E9BD8100EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      0000004B00000F811C001AAF310014A727000FA11F000C9A1800089612001399
      2500004B00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DA636400D9626300D8606200D75F6000D55E5F00D45D5E00D35C5D00A953
      54004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000009E6E
      6400FFEBD800FEEBD400FEE9D000FEE6CE00FEE5CA00FEE3C600FFE1C200FEE0
      BF00FFDEBC00FEDCB700FEDAB500FED9B100FED7AF00FED7AB00FED4A900FFD4
      A500FED1A3009F6F6000000000000000000000000000000000009E6E6400F4EA
      E100FBF2E600F8EADC00F7E6D300007000000070000000700000007000000070
      0000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF8200E7BB
      7E0080504B00000000000000000000000000000000000000000000000000004B
      00000E7D1A0028C0480021B83D001BB0330013902400004B0000169D29000997
      130013982300004B000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DE666700DD656600DC646500DA636400D9626300D8606200D75F6000AB55
      55004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B000000000000000000000000000000000000000000A372
      6600FEEEDC00FFEDD800FEEAD400FEE9D100FFE7CE00FEE6CB00FFE3C600FEE2
      C400FEE1C000FEDEBC00FFDDB80000810000FED9B200FED9AF00FED7AB00FED5
      A900FED4A6009F6F600000000000000000000000000000000000A3726600F6EE
      E900FCF6ED00F8EFE300F7EADA00F7E6D300F6E2CC00F4DEC500F3DCBD00F2D8
      B600F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC28800E7BC
      800080504B000000000000000000000000000000000000000000004B00000C77
      170035CF5E002FC9540028C149001B9F3100004B000000000000004B00000D9E
      1B000997140011972200004B0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E2696A00E1686900E0676800DE666700E06D6E00E6909100DC646500AC56
      57004E1E1F0058A55B001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B000000000000000000000000000000000000000000A775
      6800FFF0E000FEEEDD00FF3C3C00FF3C3C00FF3C3C00FF3C3C00FF3C3C00FF3C
      3C00FEE3C400FEE1C100008100000081000000810000FFDAB200FED8B000FED8
      AD00FED5AA009F6F620000000000000000000000000000000000A7756800F8F3
      F000FEFBF600FBF3EB00F8EEE300F8EBDC00F7E7D300F6E2CC00F4E0C5000070
      000000700000007000000070000000700000EDCB9C00EDC79500EDC58F00E9BF
      870080504B000000000000000000000000000000000000000000004B00003FD9
      6F003BD7680036D0600020AA3B00004B0000000000000000000000000000004B
      0000097411000A99150011962000004B00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E76D6E00E66C6D00E56B6C00E36A6B00EEA6A700FFFFFF00EB9C9C00AF58
      59004E1E1F00EECEAF00B7EBAA005ED377005ED3770045CA670045CA670045CA
      6700F7B5B600824B4B000000000000000000000000000000000000000000AC79
      6900FFF2E500FFF2E200FFECEC00FFECEC00FFECEC00FFECEC00FFECEC00FFEC
      EC00FFE5C90000810000327A290064934C000081000054893E00FEDAB500FED9
      B100FED7AD00A070630000000000000000000000000000000000AC796900FAF6
      F400FFFFFE00FEF8F300FBF2EA0000700000F8EBDA00F7E6D300F7E2CC00F6E0
      C50000700000007000000070000000700000EFCEA300EECB9C00EEC99600EAC1
      8E0080504B000000000000000000000000000000000000000000004B00001C9C
      340041DC700023AD4100004B0000000000000000000000000000000000000000
      000000000000004B00000B99160010951F00004B000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EB707200EA6F7000E96E6F00E76D6E00F2A9AA00FFFFFF00EB959600B15A
      5A004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300D9F6BD00D9F6
      BD00F7B5B600824B4B000000000000000000FF3C3C00FF3C3C00FF3C3C00FF3C
      3C00FF3C3C00FF3C3C00D76B0000FF3C3C00FF3C3C00FF3C3C00FF3C3C00FF3C
      3C00FEE7CC0000810000F6E0C000FEE2C200AFBA84000081000000810000F8D9
      B100FED9B100A072640000000000000000000000000000000000B17E6B00FAF6
      F400FFFFFF00FFFEFB00FEF7F00000700000BAD4AA00F8EADA00F7E7D300F6E2
      CB00B7C79200007000000070000000700000F0D1A900EFCEA100EECB9C00EBC5
      920080504B00000000000000000000000000000000000000000000000000004B
      00002EC15200004B000000000000000000000000000000000000000000000000
      00000000000000000000004B00000C9A180009961200004B0000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EF747500EE737400ED727300EB707200EA6F7000EF909100E76D6E00B25B
      5C004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000FF3C3C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF3C
      3C00FEEAD100FFE7CF00FEE6CA00FFE3C700FFE2C200EED9B500008100000081
      0000FEDCB6009D70650000000000000000000000000000000000B6816C00FAF6
      F400FFFFFF00FFFFFF00FFFCFB00BCDAB40000700000B8D3AA00F8EBDC00B7CC
      9D0000700000B7C792000475030000700000F2D4AF00F0D1A900F0CFA300EDC9
      990080504B000000000000000000000000000000000000000000000000000000
      0000004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B00000464080009961300004B00000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F3777800F3777800F2767700F0757600EF747500EE737400ED727300B55D
      5D004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000FF464600FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF3C
      3C00FEEBD700FEEAD300FEE9CF00FEE6CC00FFE5C700FEE3C500FEE1C100FEE0
      BD00FEDDBB00896A630000000000000000000000000000000000BB846E00FAF6
      F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00BCDAB40000700000007000000070
      0000B7CC9D00F6E2CB00F6DEC40000700000F2D8B600F0D4AF00EFD0A700CEB4
      910080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000007740E00004B
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F87B7D00F77A7B00F6797A00F4787900F3777800F2767700F0757600B75F
      5F004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000FF464600FFFFFF00FFFFFF00FFFF
      FF0000000000ECFFD9000080000000000000FFFFFF00FFFFFF00FFFFFF00FF3C
      3C00FFEDDA00FFEDD700FFEAD40000810000FEE7CC00FEE5C900FFE3C600FFE1
      C200FEE1BF008067620000000000000000000000000000000000C0896F00FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEE
      E200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B09600A192
      7F0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B0000035E
      0600004B0000000000000000000000000000000000000000000000000000824B
      4B00FC7F8000FB7E7F00FA7D7E00F87B7D00F77A7B00F6797A00F4787900B860
      62004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000FF5B5B00FFFFFF00000000000000
      000000000000ECFFD90000800000000000000000000000000000FFFFFF00FF3C
      3C00FFF0DE00FEEEDC00008100000081000000810000FFE7CE00FFE6CB00FEE3
      C700FFE2C2008469640000000000000000000000000000000000C58C7000FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3
      EA00F8EEE200F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C8B00A497
      860080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B00000000000000000000000000000000000000000000824B
      4B00FF818200FF818200FE808100FC7F8000FC7F8000FB7E7F00FA7D7E00BB63
      63004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000D76B0000FFFFFF00000000000080
      0000008000000080000000800000008000000080000000000000FFFFFF00FF3C
      3C00FEF2E30000810000327D2E006499560000810000548F4700FFE7CF00FFE6
      CB00FFE5C7009868590000000000000000000000000000000000CB917300FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7
      F000FBF2E900FBF2E500E9D3C400A0675B00A0675B00A0675B00A0675B00A067
      5B00A0675B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B000000000000000000000000000000000000824B
      4B00FF818200FF818200FF818200FF818200FF818200FE808100FE808100BD65
      65004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000FF5B5B00FFFFFF0000000000ECFF
      D900ECFFD900ECFFD90000800000ECFFD900ECFFD90000000000FFFFFF00FF3C
      3C00FEF3E70000810000F7EEDA00FFEFDE00AFC497000081000000810000F8E6
      CB00FFE7CB00A5686B0000000000000000000000000000000000CF967400FBF7
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      FA00FCF7F000FFFAEF00DAC0B600A0675B00DAA16B00DD984F00E2903A00EA89
      2300A5686B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F77E7F00FF818200FF818200FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000FF5E5E00FFFFFF00000000000000
      000000000000ECFFD90000800000000000000000000000000000FFFFFF00FF3C
      3C00FFF6EB00FFF4E900FFF3E500FFF2E200FFEFE000EFE6CF00008100000081
      0000FEE9D0008469640000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFB00FFFEF700DDC4BC00A0675B00EAB47400EFA95200F6A03600A568
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00AF5E5F00D56F7000FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000FF5B5B00FFFFFF00FFFFFF00FFFF
      FF0000000000ECFFD9000080000000000000FFFFFF00FFFFFF00FFFFFF00FF3C
      3C00FFF7EF00FFF6EB00FEF4E900FFF3E600FEF2E300FFF0E000FFEFDD00FEED
      D900FEEBD5008469640000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDC7C200A0675B00EAB27300EFA75100A5686B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B0091515200B6626300EE7A7B00FF818200BF66
      66004E1E1F00914B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B000000000000000000FF5B5B00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF3C
      3C00FFF8F300FEF8F000FFF7EE00FFF4EA00FFF4E700FEF2E500FEF0E100FEEF
      DD00FFEDDA008469640000000000000000000000000000000000D4987500FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2D0CE00A0675B00EDB57200A5686B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B00985555009F58
      58004E1E1F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF5B5B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF3C
      3C00CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68008469640000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800A0675B00A5686B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF5B5B00FF5E5E00FF5E5E00FF5E
      5E00FF5E5E00FF5E5E00FF5B5B00FF464600FF464600FF3C3C00FF3C3C00FF3C
      3C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093655E00A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A46769000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D590080504B00000000000000000000000000B7818300B7818300A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400986B
      6600986B660000000000000000000000000093655F00EED4B800F4DABB00F2D5
      B100EDCEA700E6C79D00E1C09300DEBB8C00E1BB8800E5BC8400E7BC8100E7BC
      7E00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B70000000000000000000000000064636500314B
      6200AC7D7E00F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC5
      8900EBC18200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC1
      8000EABF7F0080504B00000000000000000000000000B7818300B7818300FFCE
      9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE
      9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00986B
      6600986B660000000000000000000000000093655F00EED7C000F4DEC000F0D8
      B700E9CCAB00D9BD9900C9AD8900C1A57F00C6A67E00D1AF7F00DAB47F00E1B7
      7D00E3BA7D00E7BC7E00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B700000000000000000000000000000000005084B2000F6F
      E100325F8C00B87E7A00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC5
      8F00EBC18800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E0080504B00000000000000000000000000B7818300B7818300FFCE
      9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE
      9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00986B
      6600986B660000000000000000000000000093655F00EFDAC500F6E1C600F0D9
      BC00E6CEAF00222123003E3935008C7960009D876700AA8F6B00B89A6F00C7A4
      7400D1AB7500DEB57900E5BB7D00E7BC7E00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000005B700000000000000000000000000000000000000000032A0FE0037A1
      FF00106FE200325F8B00B67D7900F2D4B100F0D1AA00EFCFA400EECB9D00EDC7
      9600EDC58F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E0080504B00000000000000000000000000B4817600B4817600FEF5
      E000FFCE9D00FFCE9D00FFCE9D00FFCE9D000000000000000000000000000000
      000000000000FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00986B
      6600986B660000000000000000000000000093656000F0DECC00F7E5CE00F4DE
      C500EAD4B6003C3835001F1F2100182A330034434400836F56008E7759009E83
      5F00B2926800C7A36F00D9B17600E3BA7D00E7BC7E00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000005B7000005
      B7000000000000000000000000000000000000000000000000000000000037A4
      FE00379FFF000E6DDE00355F8900BB7F7900F2D4B000F0D1AA00EFCEA300EECB
      9C00EDC79500EDC58F00EBC18900E9BD8100E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E0080504B00000000000000000000000000B4817600B4817600FFFF
      FF00FEF5E000FFCE9D00FFCE9D00FFCE9D0000000000FFFFFF00008000000080
      000000000000FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00986B
      6600986B660000000000000000000000000095666000F2E2D300FAEAD700F6E3
      CE00F0DAC200AC9D8A00113B4E0004689A00064F75000C3C52003A4948007764
      4C0089725300A4865F00BC996900D1AB7300E1B77900E3BA7B009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000009365
      600037A4FE00359EFF000F6FDE0035608B00A67B7F00F2D5B100F0D1AA00EFCE
      A300EECB9C00EDC79600EDC59000EBC18900E9BF8200E9BD7F00E9BD7F00EABF
      7F00E7BC7E0080504B00000000000000000000000000B4817600B4817600FFFF
      FF00FEF5E000FEF5E000FFCE9D00FFCE9D0000000000FFFFFF00008000000080
      000000000000FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00986B
      6600986B660000000000000000000000000098696300F2E6DA00FAEEDE00F7E7
      D400F4E1CA00EBD8BD001A3E4D00036A9D00056798001B506E002A3440004135
      38006A5542007E694C00987D5800B2916300CCA66E00DAB177009D6D5F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000006F6000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      0000000000000000000000000000000000000000000000000000000000009566
      6000F2E2D30038A5FE00329DFF00156DCE00444F5B00DAB8A000925D5A009866
      6000935E5B009A666300B88A7400D7AB8200EBC18900E9BD8100E9BD7F00EABF
      7F00E7BC7E0080504B00000000000000000000000000BA8E8500BA8E8500FFFF
      FF00FFFCF400FEF5E000FEF5E000FFCE9D0000000000FFFFFF00008000000080
      000000000000FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00986B
      6600986B66000000000000000000000000009E6E6400F4EAE100FBF2E600F8EA
      DC00F7E6D300F3E0CA0074868600045983003150650095606000AA6E6E00965D
      5D00643B3A0065524000766347008E745100A9895D00C09C690096695A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      00000005B7000005B7000005B7000005B7000005B70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009869
      6300F2E6DA00FAEEDE003BABFF00A1CAE7008F6D6B0096665F00C2A38C00E9DC
      B700FBF8CB00E7DCB600BF9A89009D6B6600CB9E7B00EBC18900E9BD8100EABF
      7F00E7BC7E0080504B00000000000000000000000000BA8E8500BA8E8500FFFF
      FF000000000000000000000000000000000000000000FFFFFF00008000000080
      00000000000000000000000000000000000000000000FFCE9D00FFCE9D00986B
      6600986B6600000000000000000000000000A3726600F6EEE900FCF6ED00F8EF
      E300F7EADA00F7E6D300F0DDC9000B4159008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965C5C00643B3A0064513E006F5D4300826C4B009A7E5500865D51000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009E6E
      6400F4EAE100FBF2E600F8EADC00B4929100A06D6600EDD4A400FFFCCA00FFFF
      CF00FFFFCF00FFFFD500FFFFEA00E3D3CC0096635F00D5AB8200EBC18800EABF
      8200E7BB7E0080504B00000000000000000000000000BA8E8500BA8E8500FFFF
      FF0000000000FFFFFF0000800000008000000080000000800000008000000080
      00000080000000800000008000000080000000000000FFCE9D00FFCE9D00986B
      6600986B6600000000000000000000000000A7756800F8F3F000FEFBF600FBF3
      EB00F8EEE300F8EBDC00F6E6D1004E6C76009C696900DD9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005A35340062503D006A5841007B664800735046000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000006F6000005B7000005B700000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A372
      6600F6EEE900FCF6ED00F8EFE300A16C6700C79F8100F6D09500FCF4C200FFFF
      CF00FFFFD800FFFFEE00FFFFFA00FFFFFF00B7938700B88A7300EBC48E00EBC2
      8800E7BC800080504B00000000000000000000000000CB9A8200CB9A8200FFFF
      FF0000000000FFFFFF0000800000008000000080000000800000008000000080
      00000080000000800000008000000080000000000000FFCE9D00FFCE9D00986B
      6600986B6600000000000000000000000000AC796900FAF6F400FFFFFE00FEF8
      F300FBF2EA00F8EEE300F8EBDA00F4E3D0007B504F00E2A4A400DC9D9D00CA8C
      8C00BA7D7D00A96D6D008C5757005A353400604F3D006C59410062443C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000006F6000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A775
      6800F8F3F000FEFBF600FBF3EB009D6A6400E7C28E00EEB87F00FBF0BD00FFFF
      D000FFFFDC00FFFFF700FFFFFA00FFFFE600DCCEAD0099656000EDC79500EDC5
      8F00E9BF870080504B00000000000000000000000000CB9A8200CB9A8200FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008000000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFCE9D00FFCE9D00986B
      6600986B6600000000000000000000000000B17E6B00FAF6F400FFFFFF00FFFE
      FB00FEF7F000FBF3EA00FAEFE300F8EADA00E1CCBB007B504F00E2A3A300DC9C
      9C00CA8B8B00B87B7B00A76C6C008C5656005A35350066523F00583F37000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000005B7000006F6000006F600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AC79
      6900FAF6F400FFFFFE00FEF8F300935F5B00F7D49500EAA76C00F7DAA300FFFF
      CE00FFFFD400FFFFE100FFFFE300FFFFD700F6F2C900935E5B00EECB9C00EEC9
      9600EAC18E0080504B00000000000000000000000000CB9A8200CB9A8200FFFF
      FF000000000000000000000000000000000000000000FFFFFF00008000000080
      00000000000000000000000000000000000000000000FFCE9D00FFCE9D00986B
      6600986B6600000000000000000000000000B6816C00FAF6F400FFFFFF00FFFF
      FF00FFFCFB00FEF7F200FBF3EB00F8EEE300F8EBDC00E1CCBB0073484700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D383600533C35000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000006F6000005B7000006
      F6000006F6000006F6000005B7000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B17E
      6B00FAF6F400FFFFFF00FFFEFB009E6B6500E9C79300EAA96A00EFBD8000FAE9
      B400FFFFD000FFFFD300FFFFD100FFFFD100E1D1B00099666000EFCEA100EECB
      9C00EBC5920080504B00000000000000000000000000DCA88700DCA88700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00008000000080
      000000000000FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00FFCE9D00986B
      6600986B6600000000000000000000000000BB846E00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFEFB00FEF7F200FBF3EA00FAEEE300F8EADA00BBA196007348
      4700E1A1A100DA9A9A00C98A8A00B77A7A00A66B6B008B5555005A3535000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000006F6000006F6000006F6000005B7000006F6000000
      0000000000000006F6000006F6000006F6000006F60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B681
      6C00FAF6F400FFFFFF00FFFFFF00A4706B00CBA98900F8E2B500F0C69000F0C2
      8600F7DCA500FEF3C100FEF8C600FFFFCF00BB998400BB8F7E00F0D1A900F0CF
      A300EDC9990080504B00000000000000000000000000DCA88700DCA88700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00008000000080
      000000000000FFCE9D00FFCE9D00FFCE9D00FFCE9D00E6D9C400C6BCA900986B
      6600986B6600000000000000000000000000C0896F00FBF7F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEEE200F8EBDA00BBA1
      960073484700E0A1A100D99A9A00C78A8A00B77A7A00A66B6B008A5555005B35
      3500000000000000000000000000000000000000000000000000000000000000
      0000000000000006F6000006F6000005B7000006F6000006F600000000000000
      000000000000000000000006F6000006F6000006F6000006F600000000000000
      000000000000000000000000000000000000000000000000000000000000BB84
      6E00FAF6F400FFFFFF00FFFFFF00E5D5D500A0706800EDE3E200FFF4E200EFBD
      8000EBAB6F00F0C08600FBDEA300EBD9A90098676000DAB89F00F0D4AF00EFD0
      A700CEB4910080504B00000000000000000000000000DCA88700DCA88700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFCE9D00FFCE9D00FFCE9D00E6D9C400E6D9C400C6BCA900986B
      6600986B6600000000000000000000000000C58C7000FBF7F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3EA00F8EEE200F8EA
      D900BCA1960091606000EBAAAA00D9999900C7898900B6797900804E4E004148
      5500354756000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000006F6000006F6000006F6000000
      000000000000000000000000000000000000000000000000000000000000C089
      6F00FBF7F400FFFFFF00FFFFFF00FFFFFF00D7C0BF009E6F6B00C6A99900EAD1
      9E00FADA9C00E9C79300C59D82009D6A6400D0AC9C00F3DCBD00E5CEAF00C4B0
      9600A1927F0080504B00000000000000000000000000E3B18E00E3B18E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFCE9D00FFCE9D00B4817600B4817600B4817600B4817600B481
      7600B4817600000000000000000000000000CB917300FBF7F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7F000FBF2E900FBF2
      E500E9D3C40084544C0091606000EAAAAA00D8999900534E5700028AC40000AA
      EA0000A6E6000087C40000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F6000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F60000000000000000000000000000000000000000000000000000000000C58C
      7000FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5D5D500A4766A009A68
      6200935F5B009E6A6400BD988F00E0C4B500FAE9D000E0D0BA00B8AB9A00A79C
      8B00A497860080504B00000000000000000000000000E3B18E00E3B18E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEEFD600E3CFC900B4817600E8B27000E8B27000ECA54A00C587
      6800C5876800000000000000000000000000CF967400FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFA00FCF7F000FFFA
      EF00DAC0B6009F675B00AA78560090606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D00000082000000000000000000000000000006F6000006
      F6000006F6000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000006
      F60000000000000000000000000000000000000000000000000000000000CB91
      7300FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
      FB00FCF7F000FBF2E900FBF2E500E9D3C4009E675B0098665B0095655B009665
      5B0096655B0098685900000000000000000000000000E3B18E00E3B18E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3CFC900E3CFC900B4817600E8B27000E8B27000ECA54A00C587
      6800C5876800000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFE
      F700DDC4BC009F675B00EAB47400B77D460073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A970000008200000000000006F6000006F6000006
      F6000006F6000006F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CF96
      7400FBF7F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF7F000FFFAEF00DAC0B6009F675B00DAA16B00DD984F00E290
      3A00EA892300A5686B00000000000000000000000000EDBD9200EDBD9200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCF400E4D4D200E4D4D200B4817600FAC57700FAC57700CD9377000000
      000000000000000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDC7C2009F675B00EAB27300EFA751007A494A000093D10000B1F200012B
      A7000725DC000420B800021DB100010A9700000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFCFB00FFFEF700DDC4BC009F675B00EAB47400EFA95200F6A0
      3600A5686B0000000000000000000000000000000000EDBD9200EDBD9200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E1D0CE00E1D0CE00B4817600CF9B8600CF9B8600000000000000
      000000000000000000000000000000000000D4987500FFFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2D0CE009F675B00EDB57200A5686B0000000000000000000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F00000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DDC7C2009F675B00EAB27300EFA75100A568
      6B000000000000000000000000000000000000000000EDBD9200EDBD9200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E1D0CE00E1D0CE00B4817600CF9B8600CF9B8600000000000000
      000000000000000000000000000000000000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009F675B00A5686B00000000000000000000000000000000001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E2D0CE009F675B00EDB57200A5686B000000
      00000000000000000000000000000000000000000000EDBD9200EDBD9200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA4
      8200DAA48200DAA48200DAA48200B48176000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001322BD00050DA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E68009F675B00A5686B00000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000780000000100010000000000A00500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFF800FFFFFF000000000000FFF800FF
      FFFF000000000000FFF800FC79FF000000000000FFF800F8003F000000000000
      FFF800F00007000000000000FFF800E00000000000000000FFF800C000000000
      00000000FFF800800001000000000000FFF800800001000000000000FFF80080
      0001000000000000000801800001000000000000000803800001000000000000
      000807C00001000000000000000FC3F00003000000000000000F81FC00070000
      00000000000F00FC000F000000000000000F00FC00FF000000000000000FC3F8
      01FF000000000000000FC3F801FF000000000000000FC3F801FF000000000000
      000FC3F003FF000000000000001F87E003FF00000000000000200FE007FF0000
      0000000000701FFE0FFF000000000000E00003E00003FFC3FFFFF800E00003E0
      0003FF81FFFFF800E00003E00003FF81FFFFF800E00003E00003FF81FFFFF800
      E00003E00003FF81FFFFF800E00003E00003FF81FFFFF800E00003E00003FF81
      FFFFF800E00003E00003FF00FFFFF800E00003E00003FE007FFFF800E00003E0
      0003FC003FFFF800E00003E00003F8001F000801E00003E00003F0000F000803
      000003000003E00007000805000003000003C00003000FFC0000030000038000
      01000FFC000003000003000000000E7C000003000003800001000C7800000300
      0003E00003000800000003000003E07DC1000001000003000003E07F80000003
      000003000003F0FFC1000807000003000003FFFFE3001C7F000003000003FFFF
      F7003E7F000FFF000FFFFFFFFF007FFFFFFFFFFFFFFFFFE7FFE00003C00007FF
      FFFFFF07FFE00003C00007FFFFFFF807FFE00003C00007FFFFFFE00003E00003
      C00007FF7FFFE00003E00003C00007FE3FFFE00003E00003C00007FC1FFFE000
      03E00003C00007F80FFFE00003E00003C00007F007FFE00003E00003C00007E0
      03FFE00003E00003C00007C041FFE00003E00003C00007C0E0FFE00003E00003
      C00007C1F87FE00003000003C00007E3FC3FE00003000003C00007F7FE1FE000
      03000003C00007FFFF8FE00003000003C00007FFFFC7E00003000003C00007FF
      FFF3E00003000003C00007FFFFFDE00003000003C00007FFFFFFE00003000003
      C0000FFFFFFFE00003000003C0001FFFFFFFF80003000003C0003FFFFFFFFF07
      FF000003C0007FFFFFFFFFE7FF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      001FFFFFF9E0000380000700001FFFFFF1C0000380000700001FC7FFE3C00003
      80000700001FC3FF87C0000380000700001FC1FF0FE0000380000700001FE0FE
      1FE0000380000700001FF07C3FE0000380000700001FFC307FE0000380000700
      001FFE00FFE0000380000700001FFF01FFE0000380000700001FFF83FFE00003
      80000700001FFF01FFE0000380000700001FFE00FFE0000380000700001FFC18
      7FE0000380000700000FF83C3FE00003800007000007F07F1FE0000380000700
      0003E0FF8FE00003800007000001C1FFEFE0000380000700000083FFFFE00003
      80001F00000087FFFFE0000780003F0000C08FFFFFE0000F80003F0001E1FFFF
      FFE0001F8000FFFFFFF3FFFFFFE0003F00000000000000000000000000000000
      000000000000}
  end
  object trTmp: TpFIBTransaction
    DefaultDatabase = dbSchet
    TimeoutAction = TARollback
    Left = 336
    Top = 412
  end
end
