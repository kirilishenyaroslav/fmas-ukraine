object fmGetKorDetails: TfmGetKorDetails
  Left = 183
  Top = 135
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1103' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091' '
  ClientHeight = 567
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object pnlForButtons: TPanel
    Left = 0
    Top = 533
    Width = 787
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnExit: TcxButton
      Left = 711
      Top = 5
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
  object gdWork: TcxGrid
    Left = 0
    Top = 42
    Width = 787
    Height = 491
    Align = alClient
    TabOrder = 0
    object tvwWork: TcxGridDBBandedTableView
      DataController.DataSource = dsrWork
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,##0.00'
          Kind = skSum
          FieldName = 'OUT_SUMMA'
          Column = cmnSUMMA
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnVertSizing = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellEndEllipsis = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.Footer = True
      OptionsView.HeaderEndEllipsis = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      Styles.Background = cxBackground
      Styles.Content = cxsContent
      Styles.ContentEven = cxsContentEvent
      Styles.ContentOdd = cxsContentOdd
      Styles.Inactive = cxsInactive
      Styles.Selection = cxsSelection
      Styles.Footer = cxsFooter
      Styles.GroupByBox = cxsGroupByBox
      Styles.Header = cxsColumnHeader
      Styles.Indicator = cxsIndicator
      Styles.BandHeader = cxsHeader
      Bands = <
        item
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1072#1085#1072#1083#1110#1079#1091' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1111' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091
          Options.HoldOwnColumnsOnly = True
          Width = 770
        end>
      object cmnGR_SMET_NUM: TcxGridDBBandedColumn
        Caption = #8470' '#1043#1088'.'#1073#1102#1076#1078#1077#1090#1110#1074
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.VertSizing = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_GR_SMET_NUM'
      end
      object cmnGR_SMET_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1075#1088'.'#1073#1102#1076#1078#1077#1090#1110#1074
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 130
        Options.Filtering = False
        Options.VertSizing = False
        Width = 350
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_GR_SMET_NAME'
      end
      object cmnSMET_NUM: TcxGridDBBandedColumn
        Caption = #8470' '#1041#1102#1076#1078#1077#1090#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.VertSizing = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_SMET_NUM'
      end
      object cmnSMET_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1073#1102#1076#1078#1077#1090#1091
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.VertSizing = False
        Width = 120
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_SMET_NAME'
      end
      object cmnRAZD_NUM: TcxGridDBBandedColumn
        Caption = #8470' '#1056#1086#1079#1076#1110#1083#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.VertSizing = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_RAZD_NUM'
      end
      object cmnRAZD_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1088#1086#1079#1076#1110#1083#1091
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 130
        Options.Filtering = False
        Options.VertSizing = False
        Width = 350
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_RAZD_NAME'
      end
      object cmnSTAT_NUM: TcxGridDBBandedColumn
        Caption = #8470' '#1057#1090#1072#1090#1090#1110
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.VertSizing = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_STAT_NUM'
      end
      object cmnSTAT_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1089#1090#1072#1090#1090#1110
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 130
        Options.Filtering = False
        Options.VertSizing = False
        Width = 200
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_STAT_NAME'
      end
      object cmnKEKV_NUM: TcxGridDBBandedColumn
        Caption = #8470' '#1050#1045#1050#1042
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.VertSizing = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KEKV_NUM'
      end
      object cmnKEKV_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1050#1045#1050#1042
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 130
        Options.Filtering = False
        Options.VertSizing = False
        Width = 350
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KEKV_NAME'
      end
      object cmnSUMMA: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.VertSizing = False
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_SUMMA'
      end
    end
    object lvlWork: TcxGridLevel
      GridView = tvwWork
    end
  end
  object pnlToolBar: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object rgrTypeKor: TRadioGroup
      Left = 0
      Top = 2
      Width = 677
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
      OnClick = rgrTypeKorClick
    end
    object btnDetails: TcxButton
      Left = 680
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
    Left = 10
    Top = 485
  end
  object dstWork: TpFIBDataSet
    Database = dmdDataModul.dbJO5
    Transaction = dmdDataModul.trRead
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    UpdateTransaction = dmdDataModul.trWrite
    AutoUpdateOptions.KeyFields = 'OUT_ID_SCH'
    Left = 57
    Top = 485
    poSQLINT64ToBCD = True
  end
  object dbWork: TpFIBDatabase
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 10
    Top = 439
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
    Left = 57
    Top = 439
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
    Left = 101
    Top = 439
  end
  object srpWork: TcxStyleRepository
    Left = 102
    Top = 485
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
