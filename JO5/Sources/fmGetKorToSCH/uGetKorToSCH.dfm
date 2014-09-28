object fmGetKorToSCH: TfmGetKorToSCH
  Left = 340
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1103' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091' '
  ClientHeight = 440
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object pnlForButtons: TPanel
    Left = 0
    Top = 406
    Width = 630
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnExit: TcxButton
      Left = 555
      Top = 6
      Width = 75
      Height = 25
      Hint = #1047#1072#1082#1088#1080#1090#1080' '#1074#1110#1082#1085#1086' - <Esc>'
      Caption = #1042#1080#1093#1110#1076
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Colors.Default = 16247513
      Colors.Normal = clBtnFace
      Colors.Hot = 16247513
      Colors.Pressed = 11184895
    end
  end
  object trlKorresp: TcxDBTreeList
    Left = 0
    Top = 42
    Width = 630
    Height = 364
    Styles.Background = dmdDataModul.cxBackground
    Styles.Content = dmdDataModul.cxsContent
    Styles.Inactive = dmdDataModul.cxsInactive
    Styles.Selection = dmdDataModul.cxsSelection
    Styles.ColumnHeader = dmdDataModul.cxsHeader
    Styles.ContentEven = dmdDataModul.cxsContentEvent
    Styles.ContentOdd = dmdDataModul.cxsContentOdd
    Styles.Footer = dmdDataModul.cxsFooter
    Styles.HotTrack = dmdDataModul.cxHotTrack
    Styles.Indicator = dmdDataModul.cxsIndicator
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 150
      end>
    BufferedPaint = True
    DataController.DataSource = dsrWork
    DataController.ParentField = 'OUT_ID_PARENT_SCH'
    DataController.KeyField = 'OUT_ID_SCH'
    OptionsBehavior.ConfirmDelete = False
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.HotTrack = True
    OptionsBehavior.IncSearch = True
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsView.CellEndEllipsis = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.ExtPaintStyle = True
    OptionsView.Footer = True
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    OptionsView.IndicatorWidth = 10
    RootValue = 0
    TabOrder = 0
    OnKeyDown = trlKorrespKeyDown
    object cmnOUT_ID_SCH: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      DataBinding.FieldName = 'OUT_ID_SCH'
      Options.Footer = True
      Options.Editing = False
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      Visible = False
    end
    object cmnOUT_ID_PARENT_SCH: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      DataBinding.FieldName = 'OUT_ID_PARENT_SCH'
      Options.Footer = True
      Options.Editing = False
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      Visible = False
    end
    object cmnOUT_SCH_NUMBER: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #8470
      DataBinding.FieldName = 'OUT_SCH_NUMBER'
      MinWidth = 110
      Options.Footer = True
      Options.Editing = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      SummaryFooter.Kind = skCount
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_SCH_NUMBER'
      Width = 124
    end
    object cmnOUT_SCH_TITLE: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1053#1072#1079#1074#1072
      DataBinding.FieldName = 'OUT_SCH_TITLE'
      Options.Editing = False
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      Width = 337
    end
    object cmnOUT_SUMMA: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1057#1091#1084#1072
      DataBinding.FieldName = 'OUT_SUMMA'
      Options.Editing = False
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.Kind = skSum
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_SUMMA'
      Width = 157
    end
  end
  object pnlToolBar: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object rgrTypeKorresp: TRadioGroup
      Left = 0
      Top = 2
      Width = 519
      Height = 37
      Caption = ' '#1054#1073#1077#1088#1110#1090#1100' '#1090#1080#1087' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1111' '
      Columns = 2
      Ctl3D = False
      ItemIndex = 1
      Items.Strings = (
        #1044#1077#1073#1077#1090#1086#1074#1072
        #1050#1088#1077#1076#1080#1090#1086#1074#1072)
      ParentCtl3D = False
      TabOrder = 0
      OnClick = rgrTypeKorrespClick
    end
    object btnDetails: TcxButton
      Left = 522
      Top = 7
      Width = 106
      Height = 32
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      TabOrder = 1
      OnClick = btnDetailsClick
      Colors.Default = 16247513
      Colors.Normal = clBtnFace
      Colors.Hot = 16247513
      Colors.Pressed = 11184895
    end
  end
  object dsrWork: TDataSource
    DataSet = dstWork
    Left = 16
    Top = 334
  end
  object dstWork: TpFIBDataSet
    Database = dbWork
    Transaction = trRead
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    UpdateTransaction = trWrite
    AutoUpdateOptions.KeyFields = 'OUT_ID_SCH'
    Left = 72
    Top = 334
    poSQLINT64ToBCD = True
  end
  object dbWork: TpFIBDatabase
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 288
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dbWork
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    UserKindTransaction = 'ktrRead'
    Left = 72
    Top = 288
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dbWork
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'concurrency'
      'nowait')
    TPBMode = tpbDefault
    UserKindTransaction = 'ktrWrite'
    Left = 122
    Top = 288
  end
  object srpWork: TcxStyleRepository
    Left = 122
    Top = 335
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
end
