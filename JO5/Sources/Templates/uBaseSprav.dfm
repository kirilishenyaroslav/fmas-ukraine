object fmBaseSprav: TfmBaseSprav
  Left = 369
  Top = 166
  Width = 600
  Height = 400
  Caption = 'fmBaseSprav'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gdBaseSprav: TcxGrid
    Left = 0
    Top = 26
    Width = 592
    Height = 327
    Align = alClient
    TabOrder = 0
    object tvwBaseSprav: TcxGridDBTableView
      DataController.DataSource = dsrBaseSprav
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
    end
    object lvlBaseSprav: TcxGridLevel
      GridView = tvwBaseSprav
    end
  end
  object stbBaseSprav: TdxStatusBar
    Left = 0
    Top = 353
    Width = 592
    Height = 20
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object bmrBaseSprav: TdxBarManager
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
        Caption = #1055#1072#1085#1077#1083#1100' '#1076#1077#1081#1089#1090#1074#1080#1081
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <>
        Name = #1055#1072#1085#1077#1083#1100' '#1076#1077#1081#1089#1090#1074#1080#1081
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Edit'
      'Default')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    MenuAnimations = maUnfold
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 28
    Top = 166
    DockControlHeights = (
      0
      0
      26
      0)
    object btnAdd: TdxBarLargeButton
      Caption = 'Add'
      Category = 0
      Hint = 'Add'
      Visible = ivAlways
    end
    object btnEdit: TdxBarLargeButton
      Caption = 'Edit'
      Category = 0
      Hint = 'Edit'
      Visible = ivAlways
    end
    object btnDelete: TdxBarLargeButton
      Caption = 'Delete'
      Category = 0
      Hint = 'Delete'
      Visible = ivAlways
    end
    object btnRefresh: TdxBarLargeButton
      Caption = 'Refresh'
      Category = 0
      Hint = 'Refresh'
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Watch'
      Category = 0
      Hint = 'Watch'
      Visible = ivAlways
    end
    object btnFilter: TdxBarLargeButton
      Caption = 'Filter'
      Category = 0
      Hint = 'Filter'
      Visible = ivAlways
    end
    object btnPrint: TdxBarLargeButton
      Caption = 'Print'
      Category = 0
      Hint = 'Print'
      Visible = ivAlways
    end
    object btnSelect: TdxBarLargeButton
      Caption = 'Select'
      Category = 0
      Hint = 'Select'
      Visible = ivAlways
    end
    object btnExit: TdxBarLargeButton
      Caption = 'Exit'
      Category = 0
      Hint = 'Exit'
      Visible = ivAlways
    end
  end
  object dsrBaseSprav: TDataSource
    DataSet = dstBaseSprav
    Left = 28
    Top = 68
  end
  object dstBaseSprav: TpFIBDataSet
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    UpdateTransaction = trBaseSprav
    Left = 104
    Top = 68
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object trBaseSprav: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 28
    Top = 116
  end
  object spcBaseSprav: TpFIBStoredProc
    Transaction = trBaseSprav
    Left = 104
    Top = 116
  end
end
