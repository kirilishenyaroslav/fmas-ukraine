object fmJO5: TfmJO5
  Left = 227
  Top = 100
  Width = 795
  Height = 595
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1078#1091#1088#1085#1072#1083#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDescription: TPanel
    Left = 0
    Top = 540
    Width = 787
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 532
    Width = 787
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    AlignSplitter = salBottom
    Control = pnlDescription
  end
  object trlShet: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 613
    Height = 532
    Styles.Background = dmdDataModul.cxBackground
    Styles.Content = dmdDataModul.cxsContent
    Styles.Inactive = dmdDataModul.cxsInactive
    Styles.Selection = dmdDataModul.cxsSelection
    Styles.BandHeader = dmdDataModul.cxsHeader
    Styles.ColumnHeader = dmdDataModul.cxsColumnHeader
    Styles.ContentEven = dmdDataModul.cxsContentEvent
    Styles.ContentOdd = dmdDataModul.cxsContentOdd
    Styles.HotTrack = dmdDataModul.cxHotTrack
    Styles.Indicator = dmdDataModul.cxsIndicator
    Align = alLeft
    Bands = <
      item
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1089#1095#1105#1090#1072
        Options.OnlyOwnColumns = True
        Styles.Content = dmdDataModul.cxsContent
        Styles.Header = dmdDataModul.cxsHeader
        Styles.HeaderBackground = dmdDataModul.cxBackground
        Width = 200
      end
      item
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1054#1073#1086#1088#1086#1090#1099
        Options.OnlyOwnColumns = True
        Styles.Content = dmdDataModul.cxsContent
        Styles.Header = dmdDataModul.cxsHeader
        Styles.HeaderBackground = dmdDataModul.cxBackground
        Width = 200
      end
      item
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1057#1072#1083#1100#1076#1086
        Options.OnlyOwnColumns = True
        Styles.Content = dmdDataModul.cxsContent
        Styles.Header = dmdDataModul.cxsHeader
        Styles.HeaderBackground = dmdDataModul.cxBackground
        Width = 200
      end>
    BufferedPaint = False
    DataController.DataSource = dsrSchet
    DataController.ParentField = 'OUT_ID_PARENT_SCH'
    DataController.KeyField = 'OUT_ID_SCH'
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.IncSearch = True
    OptionsCustomizing.BandVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsView.CellEndEllipsis = True
    OptionsView.Bands = True
    OptionsView.ExtPaintStyle = True
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    OptionsView.IndicatorWidth = 10
    RootValue = -6
    TabOrder = 4
    object trlShetcxDBTreeListColumn7: TcxDBTreeListColumn
      DataBinding.FieldName = 'OUT_ID_SCH'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
    end
    object trlShetcxDBTreeListColumn8: TcxDBTreeListColumn
      DataBinding.FieldName = 'OUT_DATE_BEG'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
    end
    object trlShetcxDBTreeListColumn9: TcxDBTreeListColumn
      DataBinding.FieldName = 'OUT_DATE_END'
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
    end
    object trlShetcxDBTreeListColumn10: TcxDBTreeListColumn
      DataBinding.FieldName = 'OUT_ID_PARENT_SCH'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
    end
    object trlShetcxDBTreeListColumn1: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #8470
      DataBinding.FieldName = 'OUT_SCH_NUMBER'
      Options.Editing = False
      Options.Focusing = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      Width = 48
    end
    object trlShetcxDBTreeListColumn2: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1053#1072#1079#1074#1072#1085#1080#1077
      DataBinding.FieldName = 'OUT_SCH_TITLE'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 152
    end
    object trlShetcxDBTreeListColumn3: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1044#1077#1073#1077#1090
      DataBinding.FieldName = 'OUT_DB_SUMMA'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object trlShetcxDBTreeListColumn4: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1050#1088#1077#1076#1080#1090
      DataBinding.FieldName = 'OUT_KR_SUMMA'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 1
    end
    object trlShetcxDBTreeListColumn5: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1044#1077#1073#1077#1090
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
    object trlShetcxDBTreeListColumn6: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1050#1088#1077#1076#1080#1090
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 2
    end
  end
  object cxSplitter2: TcxSplitter
    Left = 613
    Top = 0
    Width = 8
    Height = 532
    HotZoneClassName = 'TcxMediaPlayer9Style'
    Control = trlShet
  end
  object pnlGroupElements: TPanel
    Left = 621
    Top = 0
    Width = 166
    Height = 532
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 8
    object trlSchGroups: TcxDBTreeList
      Left = 0
      Top = 292
      Width = 166
      Height = 240
      Styles.Background = dmdDataModul.cxBackground
      Styles.Content = dmdDataModul.cxsContent
      Styles.Inactive = dmdDataModul.cxsInactive
      Styles.Selection = dmdDataModul.cxsSelection
      Styles.BandHeader = dmdDataModul.cxsHeader
      Styles.ColumnHeader = dmdDataModul.cxsColumnHeader
      Styles.ContentEven = dmdDataModul.cxsContentEvent
      Styles.ContentOdd = dmdDataModul.cxsContentOdd
      Styles.HotTrack = dmdDataModul.cxHotTrack
      Styles.Indicator = dmdDataModul.cxsIndicator
      Align = alBottom
      Bands = <>
      BufferedPaint = False
      OptionsBehavior.ExpandOnIncSearch = True
      OptionsBehavior.IncSearch = True
      OptionsCustomizing.BandVertSizing = False
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.Indicator = True
      RootValue = -1
      TabOrder = 0
    end
    object cxSplitter3: TcxSplitter
      Left = 0
      Top = 284
      Width = 166
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      AlignSplitter = salBottom
      Control = trlSchGroups
    end
    object trlSmRazdSt: TcxDBTreeList
      Left = 0
      Top = 0
      Width = 166
      Height = 284
      Styles.Background = dmdDataModul.cxBackground
      Styles.Content = dmdDataModul.cxsContent
      Styles.Inactive = dmdDataModul.cxsInactive
      Styles.Selection = dmdDataModul.cxsSelection
      Styles.BandHeader = dmdDataModul.cxsHeader
      Styles.ColumnHeader = dmdDataModul.cxsColumnHeader
      Styles.ContentEven = dmdDataModul.cxsContentEvent
      Styles.ContentOdd = dmdDataModul.cxsContentOdd
      Styles.HotTrack = dmdDataModul.cxHotTrack
      Styles.Indicator = dmdDataModul.cxsIndicator
      Align = alClient
      Bands = <>
      BufferedPaint = False
      OptionsBehavior.ExpandOnIncSearch = True
      OptionsBehavior.IncSearch = True
      OptionsCustomizing.BandVertSizing = False
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.Indicator = True
      RootValue = -1
      TabOrder = 2
    end
  end
  object brJO5: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'tlbJO5'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <>
        Name = 'tlbJO5'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = False
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 4
    Top = 437
    DockControlHeights = (
      0
      0
      0
      0)
  end
  object dsrSchet: TDataSource
    DataSet = dstSchet
    Left = 44
    Top = 436
  end
  object dstSchet: TpFIBDataSet
    Database = dmdDataModul.dbJO5
    Transaction = dmdDataModul.trRead
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    UpdateTransaction = dmdDataModul.trWrite
    Left = 96
    Top = 436
    poSQLINT64ToBCD = True
  end
end
